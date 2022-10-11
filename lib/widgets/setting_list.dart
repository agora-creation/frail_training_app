import 'package:flutter/material.dart';

class SettingList extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const SettingList({
    required this.label,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF212121)),
          bottom: BorderSide(color: Color(0xFF212121)),
        ),
      ),
      child: ListTile(
        title: Text(label),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFF212121),
        ),
        onTap: onTap,
      ),
    );
  }
}
