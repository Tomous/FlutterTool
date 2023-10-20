import 'package:firstapp/constants/app_dialog.dart';
import 'package:firstapp/http_service/http_first/http_service.dart';
import 'package:firstapp/pages/home/pages/home_second/model/cook_info_model.dart';
import 'package:firstapp/pages/home/pages/home_second/pages/home_cell_view.dart';
import 'package:firstapp/refresh/refresh_footer.dart';
import 'package:firstapp/refresh/refresh_header.dart';
import 'package:firstapp/refresh/refresh_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomeSecondPage extends StatefulWidget {
  const HomeSecondPage({super.key});

  @override
  State<HomeSecondPage> createState() => _HomeSecondPageState();
}

class _HomeSecondPageState extends State<HomeSecondPage>
    with AutomaticKeepAliveClientMixin {
  /// 列表数组模型
  List<CookInfoModel> _cookInfoList = CookInfoModelList([]).list;

  /// 下拉刷新控制器
  EasyRefreshController? _easyRefreshController;

  /// 独立的滚动视图 防止tab切换时触发下拉刷新
  ScrollController? _listViewController;

  int page = 0;
  int limit = 10;
  bool hasMore = true;
  bool loading = true;
  bool error = false;
  String? errorMsg;
// 获取数据
  Future _getRecommendData({bool replace = true}) async {
    try {
      /// 全部数据
      Map<String, dynamic> result = await HttpService.getHomeRecommendData(
        page: page,
        pageSize: 10,
      );

      /// 列表数据
      List list = [];
      for (Map item in result['result']['list']) {
        list.add(item['r']);
      }
      CookInfoModelList infoList = CookInfoModelList.fromJson(list);
      setState(() {
        page++;
        if (replace) {
          _cookInfoList = infoList.list;
        } else {
          _cookInfoList.addAll(infoList.list);
        }
      });
    } catch (e) {
      setState(() {
        error = true;
        errorMsg = e.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController();
    _listViewController = ScrollController();
    _getRecommendData();
  }

  @override
  void dispose() {
    _easyRefreshController!.dispose();
    _listViewController!.dispose();
    super.dispose();
  }

  Future _onRefresh() async {
    if (error) {
      setState(() => error = false);
    }
    page = 0;
    await _getRecommendData();
    // 恢复刷新状态 使onLoad再次可用
    _easyRefreshController!.resetLoadState();
  }

  // 加载回调(null为不开启加载)
  Future _onLoad() async {
    if (hasMore) {
      await _getRecommendData(replace: false);
    }
    // 结束加载
    _easyRefreshController!.finishLoad(noMore: !hasMore);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh(
      firstRefresh: true, // 开启首次加载刷新
      firstRefreshWidget: const RefreshLoading(), // 加载时的loading样式
      // emptyWidget: ,// 空视图、异常视图
      controller: _easyRefreshController,
      header: RefreshHeaderView(),
      footer: RefreshFooterView(),
      onRefresh: _onRefresh,
      onLoad: _onLoad,
      enableControlFinishRefresh: false,
      enableControlFinishLoad: true,
      child: ListView.builder(
        controller: _listViewController,
        itemCount: _cookInfoList.length,
        shrinkWrap: true, //用于指定列表是否应根据其内容的大小自动调整大小
        itemBuilder: (context, index) {
          return InkWell(
            child: HomeCellView(
              model: _cookInfoList[index],
            ),
            onTap: () {
              AppDialog.showText(
                context,
                title: '点击了当前cell:id${_cookInfoList[index].id}',
              );
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
