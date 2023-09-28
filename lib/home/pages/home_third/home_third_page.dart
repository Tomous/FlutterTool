import 'package:firstapp/home/pages/home_third/pages/home_banner.dart';
import 'package:flutter/material.dart';
import '../home_second/model/banner_model.dart';

class HomeThirdPage extends StatefulWidget {
  const HomeThirdPage({super.key});

  @override
  State<HomeThirdPage> createState() => _HomeThirdPageState();
}

class _HomeThirdPageState extends State<HomeThirdPage> {
  /// 轮播图数据
  final List<BannerModel> _bannerList = BannerModelList([]).list;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 160.0,
            width: MediaQuery.of(context).size.width,
            child: HomeBannerView(
              bannerList: _bannerList,
            ),
          ),
        ],
      ),
    );
  }
}
