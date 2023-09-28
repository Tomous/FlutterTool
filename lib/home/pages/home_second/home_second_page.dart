import 'package:firstapp/home/pages/home_second/pages/home_cell_view.dart';
import 'package:flutter/material.dart';

class HomeSecondPage extends StatefulWidget {
  const HomeSecondPage({super.key});

  @override
  State<HomeSecondPage> createState() => _HomeSecondPageState();
}

class _HomeSecondPageState extends State<HomeSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const HomeCellView();
              },
            ),
          ),
        ],
      ),
    );
  }
}
