import 'package:flutter/material.dart';

class TweetBlackHousePage extends StatefulWidget {
  const TweetBlackHousePage({super.key});

  @override
  State<TweetBlackHousePage> createState() => _TweetBlackHousePageState();
}

class _TweetBlackHousePageState extends State<TweetBlackHousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动弹小黑屋"),
      ),
    );
  }
}
