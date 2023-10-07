import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class RefreshHeaderView extends ClassicalHeader {
  @override
  String get infoText => '下拉刷新';
  @override
  String get refreshedText => '刷新完成';
  @override
  String get refreshingText => '刷新中....';
  @override
  String get refreshReadyText => '刷新完毕';
  @override
  String get noMoreText => '数据到头了~';
  @override
  Color get textColor => Colors.black54;
}
