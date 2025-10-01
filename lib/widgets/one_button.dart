import 'package:flutter/material.dart';

class OneButton extends StatelessWidget {
  final String value;
  final IconData? icon;
  final Color? iconColor;
  final void Function(String?)? onPressed;

  const OneButton({
    super.key,
    required this.value,
    this.icon,
    this.iconColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget getWidget() {
      if (icon.toString() == "null") {
        return Text(value, style: TextStyle(fontSize: 32));
      }
      return Icon(
        icon,
        size: 32,
        color: iconColor.toString().isNotEmpty ? iconColor : Colors.white,
      );
    }

    return Card(
      child: InkWell(
        onTap: () => onPressed!(value),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Center(child: getWidget()),
        ),
      ),
    );
  }
}
