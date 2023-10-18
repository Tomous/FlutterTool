import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/home/pages/home_fourth/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class HomeFourthPage extends StatefulWidget {
  const HomeFourthPage({super.key});

  @override
  State<HomeFourthPage> createState() => _HomeFourthPageState();
}

class _HomeFourthPageState extends State<HomeFourthPage> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Container(
        margin: const EdgeInsets.only(
          top: 5.0,
        ),
        child: Column(
          children: [
            SearchBarPage(),
          ],
        ),
      ),
    );
  }
}
