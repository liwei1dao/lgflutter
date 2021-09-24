// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int?,
      json['errorMsg'] as String?,
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['admin'] as bool?,
      json['chapterTops'] as List<dynamic>?,
      json['coinCount'] as int?,
      json['collectIds'] as List<dynamic>?,
      json['email'] as String?,
      json['icon'] as String?,
      json['id'] as int?,
      json['nickname'] as String?,
      json['password'] as String?,
      json['publicName'] as String?,
      json['token'] as String?,
      json['type'] as int?,
      json['username'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'admin': instance.admin,
      'chapterTops': instance.chapterTops,
      'coinCount': instance.coinCount,
      'collectIds': instance.collectIds,
      'email': instance.email,
      'icon': instance.icon,
      'id': instance.id,
      'nickname': instance.nickname,
      'password': instance.password,
      'publicName': instance.publicName,
      'token': instance.token,
      'type': instance.type,
      'username': instance.username,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LoginModel implements LoginModel {
  _LoginModel(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://liwei1dao.cn/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResult> login(username, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'username': username, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginResult>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'user/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResult.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
