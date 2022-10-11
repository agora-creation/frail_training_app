import 'package:flutter/material.dart';

class FinishList extends StatelessWidget {
  final String label;
  final String value;
  final bool noTopBorder;

  const FinishList({
    required this.label,
    required this.value,
    this.noTopBorder = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Border border;
    if (noTopBorder == false) {
      border = const Border(
        top: BorderSide(color: Color(0xFF212121)),
        bottom: BorderSide(color: Color(0xFF212121)),
      );
    } else {
      border = const Border(
        bottom: BorderSide(color: Color(0xFF212121)),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
      child: ListTile(
        title: Text(label),
        trailing: Text(value),
      ),
    );
  }
}
