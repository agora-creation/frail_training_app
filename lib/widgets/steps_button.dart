import 'package:flutter/material.dart';

class StepsButton extends StatelessWidget {
  final int steps;

  const StepsButton({
    required this.steps,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Text(
        '$steps 歩',
        style: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
        ),
      ),
    );
  }
}
