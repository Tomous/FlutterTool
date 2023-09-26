import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/pages/home_pages/discovery_page.dart';
import 'package:firstapp/pages/home_pages/news_list_page.dart';
import 'package:firstapp/pages/home_pages/profile_page.dart';
import 'package:firstapp/pages/home_pages/tweet_page.dart';
import 'package:firstapp/pages/draw_pages/home_drawer.dart';
import 'package:firstapp/widgets/navigation_icon_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _appBarTitle = ['首页', '资讯', '发现', '我的'];
  late List<NavigationIconView> _navigationIconViews;
  late List<Widget> _pages;
  int _currentIndex = 0;
  //增加ViewPager滑动切换效果
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _navigationIconViews = [
      NavigationIconView(
          title: _appBarTitle[0],
          iconPath: 'assets/icons/ic_nav_tweet_normal.png',
          activeIconPath: 'assets/icons/ic_nav_tweet_actived.png'),
      NavigationIconView(
          title: _appBarTitle[1],
          iconPath: 'assets/icons/ic_nav_news_normal.png',
          activeIconPath: 'assets/icons/ic_nav_news_actived.png'),
      NavigationIconView(
          title: _appBarTitle[2],
          iconPath: 'assets/icons/ic_nav_discover_normal.png',
          activeIconPath: 'assets/icons/ic_nav_discover_actived.png'),
      NavigationIconView(
          title: _appBarTitle[3],
          iconPath: 'assets/icons/ic_nav_my_normal.png',
          activeIconPath: 'assets/icons/ic_nav_my_pressed.png'),
    ];

    _pages = const [
      NewsListPage(),
      TweetPage(),
      DiscoveryPage(),
      ProfilePage(),
    ];
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //判断如果是我的模块，就不需要appBar
      appBar: _currentIndex != 3
          ? AppBar(
              elevation: 0.0, //去掉标题栏的阴影
              title: Text(
                _appBarTitle[_currentIndex],
                style: const TextStyle(color: Color(AppColors.APP_BAR_COLOR)),
              ),
              centerTitle: true,
              backgroundColor: const Color(AppColors.APP_THEME_COLOR),
            )
          : null,
      //用PageView实现左右滑动切换
      body: PageView.builder(
        itemBuilder: (context, index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        // physics: const NeverScrollableScrollPhysics(), //阻止进行滑动
        onPageChanged: (index) {
          setState(() {
            //当其滑动时，底部导航栏也跟着切换
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _navigationIconViews.map((e) => e.item).toList(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(AppColors.APP_THEME_COLOR),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          //切换TabBar时就不左右滑动了
          _pageController.animateToPage(
            index,
            duration: const Duration(microseconds: 1),
            curve: Curves.ease,
          );
        },
      ),
      //侧滑菜单只在首页显示
      drawer: _currentIndex == 0
          ? const HomeDrawer(
              headerImgPath: 'assets/images/image2.jpeg',
              menuIconList: [
                Icons.send,
                Icons.check_box,
                Icons.home,
                Icons.error,
                Icons.settings
              ],
              menuTitleList: ['瀑布流布局', 'Checkbox复选框', '动弹小黑屋', '小组件', '设置'],
            )
          : null, //侧滑菜单
    );
  }
}
