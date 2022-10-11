import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frail_training_app/common/dialogs.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void nextScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void replaceScreen(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
      fullscreenDialog: true,
    ),
  );
}

Future<String?> getPrefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future setPrefs(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future removePrefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

Future<int?> getPrefsInt(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

Future setPrefsInt(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

void changeApp(BuildContext context, AppLifecycleState state) async {
  switch (state) {
    case AppLifecycleState.inactive:
      await closeApp();
      break;
    case AppLifecycleState.paused:
      await closeApp();
      break;
    case AppLifecycleState.resumed:
      int getSteps = await openApp();
      if (getSteps != 0) {
        showDialog(
          context: context,
          builder: (_) => StepsDialog(steps: getSteps),
        );
        int befSteps = await getPrefsInt('steps') ?? 0;
        int steps = befSteps + getSteps;
        await setPrefsInt('steps', steps);
      }
      break;
    case AppLifecycleState.detached:
      await closeApp();
      break;
  }
}

Future<int> openApp() async {
  int steps = 0;
  List<HealthDataPoint> healthDataList = [];
  await Permission.activityRecognition.request().isGranted;
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  int? lastTime = await getPrefsInt('lastTime');
  if (lastTime != null) {
    startTime = DateTime.fromMillisecondsSinceEpoch(lastTime);
  }
  HealthFactory health = HealthFactory();
  List<HealthDataType> types = [
    HealthDataType.STEPS,
  ];
  bool accessWasGranted = await health.requestAuthorization(types);
  if (accessWasGranted) {
    try {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        startTime,
        endTime,
        types,
      );
      healthDataList.addAll(healthData);
    } catch (e) {
      if (kDebugMode) {
        print('Caught exception in getHealthDataFromTypes: $e');
      }
    }
    healthDataList = HealthFactory.removeDuplicates(healthDataList);
    for (var e in healthDataList) {
      steps += e.value.hashCode;
    }
  }
  await removePrefs('lastTime');
  return steps;
}

Future closeApp() async {
  int nowTimestamp = DateTime.now().millisecondsSinceEpoch;
  await setPrefsInt('lastTime', nowTimestamp);
}
