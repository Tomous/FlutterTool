import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/widgetTool/dropdown_menu.dart';
import 'package:firstapp/widgetTool/stepper_page.dart';
import 'package:firstapp/widgetTool/widget_tool.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/utils/utils.dart' as utils;

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  static const double dividerHeight = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("小组件"),
        backgroundColor: const Color(AppColors.APP_THEME_COLOR),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: ListView(
          children: [
            const WidgetTool(
              title: 'DropdownMenu：',
              widget: DropdownMenuPage(),
            ),
            const Divider(height: dividerHeight),
            WidgetTool(
              title: '自定义字体：',
              widget: Center(
                child: Text(
                  'this is a custom font',
                  style: utils.getCustomFontTextStyle(),
                ),
              ),
            ),
            const Divider(height: dividerHeight),
            const Text(
              'Stepper：',
              style: TextStyle(
                color: Color(
                  AppColors.APP_THEME_COLOR,
                ),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const StepperPage(),
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}
