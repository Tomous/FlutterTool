import 'dart:convert';

import 'package:dio/dio.dart';

import 'http.dart';

class HttpService {
  // ignore: constant_identifier_names
  static const String BASE_URL = 'https://api.douguo.net/';
  // ignore: constant_identifier_names
  static const String GET_BASE_URL = 'https://m.douguo.com/';

  //首页推荐数据
  static Future getHomeRecommendData({int page = 1, int pageSize = 10}) async {
    final response = await Http.post(
      '${BASE_URL}home/recommended/${page * pageSize}/10',
      params: {
        '_session': '1628128796-4926D5D3-18DB-48D7-B85A-D065350C3BA5',
        'auto_play_mode': '2',
        'code': '79c0d8972caf4383',
        'device_id': '4926D5D3-18DB-48D7-B85A-D065350C3BA5',
        'direction': page,
        'elapsed_milliseconds': '9223372036854775807',
        'bottom_id': '0',
        'request_count': '10',
        'user_id': '0'
      },
      cancelToken: CancelToken(),
      options: Options(),
    );

    /// 字符串转化为Json
    Map<String, dynamic> responseData = jsonDecode(response);
    return responseData;
  }
}
