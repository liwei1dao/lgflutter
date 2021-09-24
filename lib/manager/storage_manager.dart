import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  late SharedPreferences _sharedPreferences;
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  saveInteger(String key, int value) => _sharedPreferences.setInt(key, value);

  saveString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  saveBool(String key, bool value) => _sharedPreferences.setBool(key, value);

  saveDouble(String key, double value) =>
      _sharedPreferences.setDouble(key, value);

  saveStringList(String key, List<String> value) =>
      _sharedPreferences.setStringList(key, value);

  int getInteger(String key, [int defaultValue = 0]) {
    var value = _sharedPreferences.getInt(key);
    return value ?? defaultValue;
  }

  String getString(String key, [String defaultValue = '']) {
    var value = _sharedPreferences.getString(key);
    return value ?? defaultValue;
  }

  bool getBool(String key, [bool defaultValue = false]) {
    var value = _sharedPreferences.getBool(key);
    return value ?? defaultValue;
  }

  double getDouble(String key, [double defaultValue = 0.0]) {
    var value = _sharedPreferences.getDouble(key);
    return value ?? defaultValue;
  }

  List<String> getStringList(String key,
      [List<String> defaultValue = const <String>[]]) {
    var value = _sharedPreferences.getStringList(key);
    return value ?? defaultValue;
  }

  void clear() {
    _sharedPreferences.clear();
  }
}

class StorageManager extends Storage {
  static StorageManager? _instance;
  static StorageManager get instance => StorageManager();
  StorageManager._internal();
  factory StorageManager() {
    if (_instance == null) _instance = StorageManager._internal();
    return _instance!;
  }

  late UserInfoSp user;

  Future<void> init() async {
    await super.init();
    user = UserInfoSp(this);
  }
}

class UserInfoSp {
  late Storage _storage;
  static final String ID = "uid";
  static final String TOKEN = "token";
  static final String USER_NAME = "userName";

  UserInfoSp(Storage storage) {
    _storage = storage;
  }
  int? _uid;

  int get uid => _storage.getInteger(ID);

  set uid(int value) => _storage.saveInteger(ID, value);

  String? _token;

  String get token => _storage.getString(TOKEN);

  set token(String value) => _storage.saveString(TOKEN, value);

  String? _userName;

  String get userName => _storage.getString(USER_NAME);

  set userName(String value) => _storage.saveString(USER_NAME, value);

  bool? _isLogin;

  get isLogin => uid != 0;

  void clear() {
    _storage.clear();
  }
}
