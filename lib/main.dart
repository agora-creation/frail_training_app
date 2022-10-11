import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frail_training_app/common/styles.dart';
import 'package:frail_training_app/screens/title.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'フレイル予防トレーニング',
      theme: themeData(),
      home: const TitleScreen(),
    );
  }
}
