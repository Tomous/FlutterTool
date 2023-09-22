import 'package:firstapp/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List menuTitiles = [
    '我的消息',
    '阅读记录',
    '我的博客',
    '我的问答',
    '我的活动',
    '我的团队',
    '邀请好友',
  ];
  List menuIcons = [
    Icons.message,
    Icons.print,
    Icons.error,
    Icons.phone,
    Icons.send,
    Icons.people,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 240.0,
            backgroundColor: const Color(AppColors.APP_THEME_COLOR),
            flexibleSpace: FlexibleSpaceBar(
              // title: const Text('个人中心'),
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('./assets/images/image1.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/icons/ic_avatar_default.png'),
                            ),
                          ),
                        ),
                        onTap: () {
                          //执行登录操作
                          _login();
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        '点击头像登陆',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floating: true,
          ),
        ];
      },
      body: ListView.separated(
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(menuIcons[index]),
            title: Text(menuTitiles[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(); //分隔线
        },
        itemCount: menuTitiles.length,
      ),
    );
  }

  void _login() {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const LoginWebPage()));
  }
}
