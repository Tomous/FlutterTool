import 'package:flutter/material.dart';

class NavigationIconView {
  //item
  final BottomNavigationBarItem item;
  //title
  final String title;
  //icon path
  final String iconPath;
  //active icon path
  final String activeIconPath;

  NavigationIconView({
    required this.title,
    required this.iconPath,
    required this.activeIconPath,
  }) : item = BottomNavigationBarItem(
          icon: Image.asset(
            iconPath,
            width: 24.0,
            height: 24.0,
          ),
          activeIcon: Image.asset(
            activeIconPath,
            width: 24.0,
            height: 24.0,
          ),
          label: title,
        );
}
