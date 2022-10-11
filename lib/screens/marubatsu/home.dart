import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MarubatsuHomeScreen extends StatelessWidget {
  const MarubatsuHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
