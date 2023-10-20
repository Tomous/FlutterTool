import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/pages/home/pages/home_fourth/pages/data_list.dart';
import 'package:firstapp/pages/home/pages/home_fourth/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeFourthPage extends StatefulWidget {
  const HomeFourthPage({super.key});

  @override
  State<HomeFourthPage> createState() => _HomeFourthPageState();
}

class _HomeFourthPageState extends State<HomeFourthPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final tabs = ['政策法规', '出行常识'];
  String searchKeyword = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Container(
        margin: const EdgeInsets.only(
          top: 5.0,
        ),
        child: Column(
          children: [
            const SearchBarPage(),
            Container(
              alignment: Alignment.centerLeft,
              height: 40.0,
              child: Tabs(controller: tabController, tabs: tabs),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(), //模拟了一个具有回弹效果的滚动行为
                controller: tabController,
                children: [
                  DataListPage(type: 1, keyword: searchKeyword),
                  DataListPage(type: 2, keyword: searchKeyword),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;
  const Tabs({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      physics: const NeverScrollableScrollPhysics(),
      isScrollable: true,
      labelColor: AppColors.text2,
      unselectedLabelColor: AppColors.text5,
      dividerColor: Colors.transparent,
      labelPadding: const EdgeInsets.only(left: 10.0, right: 30.0),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      labelStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 5.0,
      indicator: MaterialIndicator(
        color: Colors.blue,
        height: 4.0,
        bottomLeftRadius: 4.0,
        bottomRightRadius: 4.0,
        horizontalPadding: 18.0,
      ),
      tabs: tabs.map((e) => Tab(text: e)).toList(),
      controller: controller,
    );
  }
}
