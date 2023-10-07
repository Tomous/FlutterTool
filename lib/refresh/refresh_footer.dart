import 'package:flutter_easyrefresh/easy_refresh.dart';

class RefreshFooterView extends ClassicalFooter {
  @override
  String get loadedText => '加载完成';
  @override
  String get loadText => '上拉加载';
  @override
  String get infoText => '上拉加载';
  @override
  String get loadReadyText => '准备加载';
  @override
  String get loadingText => '加载中....';
  @override
  String get noMoreText => '数据到头了~';
}
