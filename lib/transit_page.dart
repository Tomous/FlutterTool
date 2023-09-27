import 'dart:async';

import 'package:firstapp/tabbar_page.dart';
import 'package:flutter/material.dart';

class TransitPage extends StatefulWidget {
  const TransitPage({super.key});

  @override
  State<TransitPage> createState() => _TransitPageState();
}

class _TransitPageState extends State<TransitPage> {
  int _currentTime = 1;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    // 开始定时器,一秒刷新一次
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime--;
      });
      if (_currentTime == 0) {
        _jumpHome();
      }
    });
  }

// 跳转首页方法
  void _jumpHome() {
    _timer?.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const TabBarPage(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/image10.jpeg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            right: 10,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 60.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const Text(
                    '广告',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
                const SizedBox(width: 7.0),
                InkWell(
                  child: _clipButton(),
                  onTap: () {
                    _jumpHome();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _clipButton() {
    return Container(
      width: 60.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_currentTime}s',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          const Text(
            " 跳过",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
