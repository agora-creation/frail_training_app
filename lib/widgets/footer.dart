import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function()? onPressed;

  const Footer({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF424242),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: const Icon(
            Icons.settings,
            color: Color(0xFFFFFFFF),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
