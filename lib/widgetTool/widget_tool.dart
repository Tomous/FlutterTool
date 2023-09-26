import 'package:firstapp/constants/constants.dart';
import 'package:flutter/material.dart';

class WidgetTool extends StatelessWidget {
  final String title;
  final Widget widget;
  const WidgetTool({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(
                AppColors.APP_THEME_COLOR,
              ),
              fontSize: 16.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          widget,
        ],
      ),
    );
  }
}
