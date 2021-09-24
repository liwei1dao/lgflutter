import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lgflutter/manager/storage_manager.dart';
import 'package:lgflutter/page/login/login_model.dart';

const url = "https://www.wanandroid.com/";

Dio dio = Dio(
    BaseOptions(baseUrl: url, connectTimeout: 30000, receiveTimeout: 30000));

void initRestClient() {
  dio.interceptors.add(LogInterceptor(
      requestHeader: true, requestBody: true, responseBody: true));
  dio.interceptors.add(RequestHeadInterceptor());
}

class RequestHeadInterceptor extends Interceptor {
  @override
  Future? onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers
        .addAll({"Cookie": "JSESSIONID=${StorageManager.instance.user.token}"});
    return super.onRequest(options, handler) as Future<dynamic>?;
  }
}

@module
abstract class RetrofitModule {
  LoginModel loginModel() {
    final client = LoginModel(dio);
    return client;
  }
}
