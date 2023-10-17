// 大按钮
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final String text;
  final IconData? icon;
  final Color? color;

  const LargeButton(
    this.text, {
    Key? key,
    this.onPressed,
    this.icon,
    this.onLongPress,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 42),
        backgroundColor: color,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: icon != null
            ? [Icon(icon), const SizedBox(width: 5), Text(text)]
            : [Text(text)],
      ),
    );
  }
}
