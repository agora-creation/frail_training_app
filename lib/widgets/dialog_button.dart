import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Function()? onPressed;

  const DialogButton({
    required this.label,
    required this.backgroundColor,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        primary: Colors.white,
      ),
      child: Text(label),
    );
  }
}
