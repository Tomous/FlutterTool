// 大按钮
import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/constants/consts.dart';
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

class Empty extends StatelessWidget {
  final String? text;
  final String? icon;
  final Widget? child;
  final double? height;

  const Empty({
    Key? key,
    this.text,
    this.icon = 'empty_3.png',
    this.child,
    this.height = 360,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/$icon',
              width: 150,
              fit: BoxFit.contain,
            ),
            Text(
              text ?? '暂无数据',
              style: TextStyle(fontSize: 13, color: AppColors.text6),
            ),
            const SizedBox(height: 20),
            child ?? nothing,
          ],
        ),
      ),
    );
  }
}
