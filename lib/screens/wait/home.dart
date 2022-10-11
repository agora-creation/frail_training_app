import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frail_training_app/common/dialogs.dart';

class WaitHomeScreen extends StatefulWidget {
  const WaitHomeScreen({Key? key}) : super(key: key);

  @override
  State<WaitHomeScreen> createState() => _WaitHomeScreenState();
}

class _WaitHomeScreenState extends State<WaitHomeScreen> {
  Timer? _timer;
  final int _seconds = 5;
  int _currentSeconds = 0;

  Timer countDown() {
    return Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSeconds < 1) {
        timer.cancel();
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const FinishDialog(),
        );
      } else {
        setState(() => _currentSeconds -= 1);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _currentSeconds = _seconds;
    _timer = countDown();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SizedBox(
            height: double.infinity,
            child: Center(
              child: Text(
                'あと$_currentSeconds秒で何かが起こる？',
                style: const TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
