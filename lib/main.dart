import 'package:firstapp/app_theme.dart';
import 'package:firstapp/transit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //屏幕适配方案，用于调整屏幕和字体大小
    return ScreenUtilInit(
      designSize: const Size(750, 1334), //设计稿中设备的尺寸
      minTextAdapt: true, //是否根据宽度/高度中的最小值适配文字大小
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: '开源中国',
          theme: appTheme,
          builder: EasyLoading.init(),
          home: const TransitPage(),
        );
      },
    );
  }
}
