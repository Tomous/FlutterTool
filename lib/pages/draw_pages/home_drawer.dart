import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/pages/draw_pages/sub_pages/small_widget.dart';
import 'package:firstapp/pages/draw_pages/sub_pages/check_box_page.dart';
import 'package:firstapp/pages/draw_pages/sub_pages/publish_tweet_page.dart';
import 'package:firstapp/pages/draw_pages/sub_pages/setting_page.dart';
import 'package:firstapp/pages/draw_pages/sub_pages/tweet_black_house.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final String headerImgPath;
  final List menuTitleList;
  final List menuIconList;
  const HomeDrawer({
    super.key,
    required this.headerImgPath,
    required this.menuTitleList,
    required this.menuIconList,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> menuPageList = [
      const PublishTweetPage(),
      const CheckBoxPage(),
      const TweetBlackHousePage(),
      const AboutPage(),
      const SettingPage(),
    ];
    return Drawer(
      child: ListView.separated(
        padding: const EdgeInsets.all(0.0), //解决状态栏问题
        itemBuilder: (context, index) {
          if (index == 0) {
            //第一个则显示顶部图片
            return Image.asset(
              headerImgPath,
              fit: BoxFit.cover,
            );
          }
          index -= 1;
          return ListTile(
            leading: Icon(menuIconList[index]),
            title: Text(
              menuTitleList[index],
              style: AppTextStyles.APP_TITLE_TEXT_STYLE,
            ),
            trailing: const Icon(Icons.arrow_forward_ios), //右箭头
            onTap: () {
              _navigationPush(context, menuPageList[index]);
            },
          );
        },
        separatorBuilder: (context, index) {
          //列表分隔线
          return Divider(height: index == 0 ? 0.0 : 1.0);
        },
        itemCount: menuTitleList.length + 1,
      ),
    );
  }

  _navigationPush(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
