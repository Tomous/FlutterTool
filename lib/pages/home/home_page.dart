import 'package:firstapp/constants/app_dialog.dart';
import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/pages/home/home_draw/home_drawer.dart';
import 'package:firstapp/pages/home/pages/home_first/home_first_page.dart';
import 'package:firstapp/pages/home/pages/home_five/home_five_page.dart';
import 'package:firstapp/pages/home/pages/home_fourth/home_fourth_page.dart';
import 'package:firstapp/pages/home/pages/home_second/home_second_page.dart';
import 'package:firstapp/pages/home/pages/home_seven/home_seven_page.dart';
import 'package:firstapp/pages/home/pages/home_six/home_six_page.dart';
import 'package:firstapp/pages/home/pages/home_third/home_third_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const List<Tab> _tabs = [
  Tab(text: '承诺签约'),
  Tab(text: '推荐'),
  Tab(text: '笔记'),
  Tab(text: '视频'),
  Tab(text: '母婴'),
  Tab(text: '安佳烘焙'),
  Tab(text: '活动'),
];
final List<Widget> _tabContents = [
  const HomeFirstPage(),
  const HomeSecondPage(),
  const HomeThirdPage(),
  const HomeFourthPage(),
  const HomeFivePage(),
  const HomeSixPage(),
  const HomeSevenPage(),
];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this, // 将当前状态对象作为 TickerProvider
      initialIndex: 1, // 默认选中哪一个
    );
    _tabController.addListener(() {
      _tabController.index; // 获取当前选中的索引
      if (_tabController.indexIsChanging) {
        //只在索引变化时执行代码，而不是每次addListener被调用时都执行
        AppDialog.showText(context, title: '当前选中的索引：${_tabController.index}');
      }
    });
  }

  @override
  void dispose() {
    // 释放对象
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '首页',
          style: AppTextStyles.APP_TITLE_TEXT_STYLE,
        ),
        centerTitle: true,
        backgroundColor: const Color(AppColors.APP_THEME_COLOR),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            color: Colors.white,
            child: TabBar(
              tabs: _tabs,
              isScrollable: true,
              controller: _tabController,
              labelColor: Colors.blue,
              indicatorColor: Colors.blue,
              labelPadding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
              onTap: (value) {},
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabContents,
      ),
      //侧滑菜单
      drawer: const HomeDrawer(
        headerImgPath: 'assets/images/image2.jpeg',
        menuIconList: [
          Icons.send,
          Icons.check_box,
          Icons.home,
          Icons.error,
          Icons.settings
        ],
        menuTitleList: ['瀑布流布局', 'Checkbox复选框', '动弹小黑屋', '小组件', '设置'],
      ), //侧滑菜单
    );
  }
}
