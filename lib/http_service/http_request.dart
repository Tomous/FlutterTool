import 'package:dio/dio.dart';

// http 请求单例类
class HttpRequest {
  // 工厂构造方法
  factory HttpRequest() => _instance;
  // 初始化一个单例实例
  static final HttpRequest _instance = HttpRequest._internal();
  // dio 实例
  Dio? dio;
  // 内部构造方法
  HttpRequest._internal() {
    if (dio == null) {
      // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
      BaseOptions baseOptions = BaseOptions(
        connectTimeout: HttpOptions.CONNECT_TIMEOUT,
        receiveTimeout: HttpOptions.RECEIVE_TIMEOUT,
        headers: {},
      );

      // 没有实例 则创建之
      dio = Dio(baseOptions);
      // 添加拦截器
      dio!.interceptors.add(HttpInterceptor());
    }
  }

  /// 初始化公共属性 如果需要覆盖原配置项 就调用它
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [headers] 请求头
  /// [interceptors] 基础拦截器
  void init({
    required String baseUrl,
    required int connectTimeout,
    required int receiveTimeout,
    required Map<String, dynamic> headers,
    required List<Interceptor> interceptors,
  }) {
    dio!.options.baseUrl = baseUrl;
    dio!.options.connectTimeout = connectTimeout;
    dio!.options.receiveTimeout = receiveTimeout;
    dio!.options.headers = headers;
    if (interceptors.isNotEmpty) {
      dio!.interceptors.addAll(interceptors);
    }
  }

  /// 设置请求头
  void setHeaders(Map<String, dynamic> headers) {
    dio!.options.headers = headers;
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求
   * 当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({required CancelToken cancelToken}) {
    // ignore: unnecessary_statements
    cancelToken;
  }

  /// 设置鉴权请求头
  Options setAuthorizationHeader(Options requestOptions) {
    String? token;
    if (token != null) {
      requestOptions.headers!['token'] = token;
    }
    return requestOptions;
  }

  /// restful get 操作
  Future get(
    String path, {
    required Map<String, dynamic> params,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options);
    Response response = await dio!.get(
      path,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post 操作
  Future post(
    String path, {
    required Map<String, dynamic> params,
    dynamic data,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options);
    Response response = await dio!.post(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    required Map<String, dynamic> params,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    Options requestOptions = setAuthorizationHeader(options);
    Response response = await dio!.post(
      path,
      data: FormData.fromMap(params),
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}

// 请求配置
class HttpOptions {
  // 连接服务器超时时间，单位是毫秒
  // ignore: constant_identifier_names
  static const int CONNECT_TIMEOUT = 30000;

  // 接收超时时间，单位是毫秒
  // ignore: constant_identifier_names
  static const int RECEIVE_TIMEOUT = 30000;

  // 地址前缀
  // ignore: constant_identifier_names
  static const String BASE_URL = 'https://api.douguo.net/';
}

// 自定义拦截器
class HttpInterceptor extends Interceptor {
  // 请求拦截
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // do something...
    super.onRequest(options, handler);
  }

  // 响应拦截
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // do something...
    super.onResponse(response, handler);
  }

  // 错误拦截
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // 覆盖异常为自定义的异常类
    HttpException httpException = HttpException.create(err);
    err.error = httpException;
    super.onError(err, handler);
  }
}

// 自定义 http 异常
class HttpException implements Exception {
  final int code;
  final String msg;

  HttpException({this.code = 500, this.msg = '未知异常，请联系管理员'});

  @override
  String toString() {
    return "HttpError [$code]: $msg";
  }

  factory HttpException.create(DioError error) {
    // dio 异常
    switch (error.type) {
      case DioErrorType.cancel:
        return HttpException(code: -1, msg: '请求取消');
      case DioErrorType.connectTimeout:
        return HttpException(code: -1, msg: '连接超时');
      case DioErrorType.sendTimeout:
        return HttpException(code: -1, msg: '请求超时');
      case DioErrorType.receiveTimeout:
        return HttpException(code: -1, msg: '响应超时');
      case DioErrorType.response:
        // 服务器异常
        int? statusCode = error.response!.statusCode;
        switch (statusCode) {
          case 400:
            return HttpException(code: statusCode!, msg: '请求语法错误');
          case 401:
            return HttpException(code: statusCode!, msg: '没有权限');
          case 403:
            return HttpException(code: statusCode!, msg: '服务器拒绝执行');
          case 404:
            return HttpException(code: statusCode!, msg: '无法连接服务器');
          case 500:
            return HttpException(code: statusCode!, msg: '服务器内部错误');
          case 502:
            return HttpException(code: statusCode!, msg: '无效的请求');
          case 503:
            return HttpException(code: statusCode!, msg: '服务器挂了');
          case 505:
            return HttpException(code: statusCode!, msg: '不支持HTTP协议请求');
          default:
            return HttpException(
              code: statusCode!,
              msg: error.response!.statusMessage!,
            );
        }
      default:
        return HttpException(code: 500, msg: error.message);
    }
  }
}
