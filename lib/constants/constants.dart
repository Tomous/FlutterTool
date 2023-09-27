import 'package:flutter/material.dart';

///abstract 是一个关键字，用于定义一个抽象类 AppColors。
///在面向对象编程中，抽象类是不能直接实例化的类。它作为其他类的蓝图，
///提供了可以被其子类继承的公共属性和方法。
///抽象类旨在被其他类扩展，通常声明了必须由子类实现的抽象方法。
///在 AppColors 的情况下，它是一个抽象类，为应用程序的主题色提供了一个常量 APP_THEME_COLOR。
///由于它是抽象的，你不能使用 new 关键字直接创建它的实例。
abstract class AppColors {
  //应用主题色
  // ignore: constant_identifier_names
  static const APP_THEME_COLOR = 0xff63ca6c;

  //标题栏颜色
  // ignore: constant_identifier_names
  static const APP_BAR_COLOR = 0xffffffff;

  static const Color primary = Color(0xfffbfbfb);

  static const Color success = Color(0xff07c160);

  static const Color danger = Color(0xffee0a24);

  static const Color warning = Color(0xffffba00);

  static const Color info = Color(0xff00a1d6);

  static const Color active = Colors.amber;

  static const Color black = Color.fromRGBO(61, 57, 58, 1.0);

  static const Color qianTextColor = Color.fromRGBO(153, 153, 153, 1);

  static const Color deepTextColor = Color.fromRGBO(18, 24, 38, 1);

  static const Color yellow = Colors.amber;

  static const Color unactive = Color(0xff7b7b7b);

  static const Color un2active = Color(0xff8d8d8d);

  static const Color un3active = Color(0xffb1b1b1);

  static const Color page = Color(0xfff7f7f7);

  static const Color nav = Color(0xfffbfbfb);

  static const Color border = Color(0xfff5f5f5);

  static const Color line = Color.fromRGBO(239, 239, 239, 1);

  static const Color white = Color.fromRGBO(245, 245, 245, 1);

  static const Color background = Color.fromRGBO(248, 248, 248, 1);

  // 颜色值转换
  // static Color string2Color(String colorString) {
  //   int value = 0x00000000;
  //   if (colorString.isNotEmpty) {
  //     if (colorString[0] == '#') {
  //       colorString = colorString.substring(1);
  //     }
  //     value = int.tryParse(colorString, radix: 16);
  //     if (value != null) {
  //       if (value < 0xFF000000) {
  //         value += 0xFF000000;
  //       }
  //     }
  //   }
  //   return Color(value);
  // }
}

abstract class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

abstract class AppTextStyles {
  //标题
  // ignore: constant_identifier_names
  static const APP_TITLE_TEXT_STYLE = TextStyle(
    color: Colors.black,
    fontSize: 20,
  );
  //正文
  // ignore: constant_identifier_names
  static const APP_BODY_TEXT_STYLE = TextStyle(
    color: Colors.grey,
    fontSize: 16,
  );
}
