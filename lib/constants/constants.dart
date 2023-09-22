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
