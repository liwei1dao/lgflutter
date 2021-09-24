import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lgflutter/base/base_model.dart';
import 'package:retrofit/http.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginResult {
  @JsonKey(name: 'data')
  Data? data;

  @JsonKey(name: 'errorCode')
  int? errorCode;

  @JsonKey(name: 'errorMsg')
  String? errorMsg;

  LoginResult(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory LoginResult.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'admin')
  bool? admin;

  @JsonKey(name: 'chapterTops')
  List<dynamic>? chapterTops;

  @JsonKey(name: 'coinCount')
  int? coinCount;

  @JsonKey(name: 'collectIds')
  List<dynamic>? collectIds;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'icon')
  String? icon;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'publicName')
  String? publicName;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'username')
  String? username;

  Data(
    this.admin,
    this.chapterTops,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@RestApi(baseUrl: "https://liwei1dao.cn/api/v1/")
abstract class LoginModel extends BaseModel {
  factory LoginModel(Dio dio) = _LoginModel;

  @POST("user/login")
  @FormUrlEncoded()
  Future<LoginResult> login(@Field() String username, @Field() String password);
}
