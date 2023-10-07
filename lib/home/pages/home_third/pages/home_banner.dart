import 'package:card_swiper/card_swiper.dart';
import 'package:firstapp/constants/app_dialog.dart';
import 'package:firstapp/home/pages/home_third/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeBannerView extends StatefulWidget {
  final List<BannerModel> bannerList;
  const HomeBannerView({super.key, required this.bannerList});

  @override
  State<HomeBannerView> createState() => _HomeBannerViewState();
}

class _HomeBannerViewState extends State<HomeBannerView> {
  final List _imageList = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: _imageList.length,
      autoplay: true,
      itemBuilder: (context, index) {
        return InkWell(
          // child: Image.network(
          //   widget.bannerList[index].i!,
          //   fit: BoxFit.cover,
          // ),
          child: Image.asset(
            _imageList[index],
            fit: BoxFit.cover,
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "点击了第${index + 1}张图片");
          },
        );
      },

      /// 横线样式
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter, //指示器显示的位置
        margin: EdgeInsets.only(bottom: 5.0), // 距离调整
        // 指示器构建器
        builder: RectSwiperPaginationBuilder(
          color: Colors.grey,
          activeColor: Colors.white,
          size: Size(18, 9),
          activeSize: Size(18, 8),
        ),
      ),

      /// 圆点样式
      //   DotSwiperPaginationBuilder(
      //     /// 点之间的间隔
      //       space: 2,
      //       /// 没选中时的大小
      //       size: 6,
      //       /// 选中时的大小
      //       activeSize: 12,
      //       /// 没选中时的颜色
      //       color: Colors.black54,
      //       ///选中时的颜色
      //       activeColor: Colors.white)
      onTap: (index) {
        AppDialog.showText(context, title: "点击了第${index + 1}张图片");
      },
    );
  }
}
