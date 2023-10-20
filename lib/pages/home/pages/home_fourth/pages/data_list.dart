import 'package:firstapp/constants/common.dart';
import 'package:firstapp/constants/constants.dart';
import 'package:firstapp/http_service/http_second/request.dart';
import 'package:firstapp/pages/home/pages/home_fourth/pages/model/teachingData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class DataListPage extends StatefulWidget {
  final int type;
  final String? keyword;
  const DataListPage({
    super.key,
    required this.type,
    this.keyword,
  });

  @override
  State<DataListPage> createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<TeachingData> _list = [];
  int _page = 1;
  String? _keyword;

  @override
  void initState() {
    super.initState();
    _getList();
  }

  Future _getList() async {
    final res = await BaiduRequest().dio.post(
      '/ihs/appoint/teaching/trains',
      data: {
        'page_no': _page,
        'page_size': 10,
        'query_entity': widget.keyword,
        'train_type': widget.type,
      },
    );
    final records = res.data?['records'] as List? ?? [];
    setState(
      () {
        final list = records.map((e) => TeachingData.fromJson(e)).toList();
        if (_page == 1) {
          _list = list;
        } else {
          _list.addAll(list);
        }
        if (list.isEmpty && _page > 1) {
          _page--;
        }
      },
    );
    return records.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.keyword != _keyword) {
      _getList();
      _keyword = widget.keyword;
    }
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
      child: EasyRefresh(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: _list.isEmpty
              ? const [Empty()]
              : _list.map((e) => LearnItem(data: e)).toList(),
        ),
        onRefresh: () async {
          _page = 1;
          await _getList();
        },
        onLoad: () async {
          _page++;
          return await _getList();
        },
      ),
    );
  }
}

class LearnItem extends StatelessWidget {
  final TeachingData data;
  const LearnItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 140,
                  height: 80,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: AppColors.text6.withAlpha(50),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.network(
                    data.trainPic,
                    fit: BoxFit.cover,
                  ),
                ),
                // ignore: unnecessary_null_comparison
                if (data.trainVideo != null)
                  const SizedBox(
                    width: 140,
                    height: 80,
                    child: Center(
                      child: Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    data.trainTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.text2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${data.createTime}',
                    style: TextStyle(color: AppColors.text5, fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
