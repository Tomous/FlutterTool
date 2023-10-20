import 'package:dio/dio.dart';
import 'package:firstapp/constants/consts.dart';
import 'package:firstapp/constants/url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaiduRequest {
  factory BaiduRequest() => _getInstance()!;

  static BaiduRequest? get instance => _getInstance();
  static BaiduRequest? _instance;

  late final Dio dio;

  static BaiduRequest? _getInstance() {
    _instance ??= BaiduRequest._internal();
    return _instance;
  }

  BaiduRequest._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: Env.serverBaseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );
    // 添加拦截器
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          var headers = options.headers;
          final prefs = await SharedPreferences.getInstance();
          String? token = prefs.getString(StorageKeys.TOKEN) ?? '';
          headers['Authorization'] = token;
          return handler.next(options);
        },
        onResponse: (response, handler) {
          final data = response.data;
          if (data != null && data['code'] == 0) {
            response.data = data['data'];
            return handler.next(response);
          } else {
            // throw DioError(
            //   type: DioErrorType.response,
            //   BaiduRequestOptions: response.BaiduRequestOptions,
            //   response: response,
            // );
            throw DioError(
              type: DioErrorType.response,
              requestOptions: response.requestOptions,
              response: response,
            );
          }
        },
        onError: (err, handler) {
          EasyLoading.dismiss();
          final data = err.response?.data;

          if (data != null) {
            int? code = data['code'];
            String? msg = data['msg'];

            if (msg != null) {
              // 去掉后台返回的错误调试信息
              msg = msg.replaceAll(RegExp(r'^[a-zA-Z0-9_-\s]+:\s?'), '');
            }

            // token 失效或错误
            if (err.response?.statusCode == 401 ||
                code == 1004 ||
                code == 1005) {
              // final account = Account.current;
              // if (account.token != null && account.token!.isNotEmpty) {
              //   account.refreshToken();
              // }
            } else {
              EasyLoading.showToast(msg ?? '出错了');
            }
          } else {
            switch (err.type) {
              case DioErrorType.sendTimeout:
              case DioErrorType.receiveTimeout:
              case DioErrorType.connectTimeout:
                EasyLoading.showToast('请求超时');
                break;
              case DioErrorType.cancel:
                EasyLoading.showToast('取消请求');
                break;
              default:
                EasyLoading.showToast('网络异常，请检查网络设置');
                break;
            }
          }
          return handler.next(err);
        },
      ),
    );
  }
}
