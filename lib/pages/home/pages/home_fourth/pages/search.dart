import 'package:firstapp/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarPage extends StatefulWidget {
  const SearchBarPage({super.key});

  @override
  State<SearchBarPage> createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.text6.withAlpha(50),
      ),
      child: TextField(
        controller: _searchController,
        onSubmitted: (value) => Get.snackbar('提示', '点击了搜索$value'),
        decoration: InputDecoration(
          hintText: '输入关键词搜索',
          contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
          prefixIcon: Icon(Icons.search, color: AppColors.text6),
          hintStyle: TextStyle(color: AppColors.text6),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () => _searchController.text = '',
            icon: Icon(
              Icons.cancel,
              color: AppColors.text6,
              size: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
