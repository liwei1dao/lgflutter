// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../page/home/home_model.dart' as _i3;
import '../../page/home/home_view_model.dart' as _i4;
import '../../page/login/login_model.dart' as _i5;
import '../../page/login/login_view_model.dart' as _i6;
import '../../page/splash/splash_model.dart' as _i7;
import '../../page/splash/splash_view_model.dart' as _i8;
import '../dio/dio.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final retrofitModule = _$RetrofitModule();
  gh.factory<_i3.HomeModel>(() => _i3.HomeModel());
  gh.factory<_i4.HomeViewModel>(() => _i4.HomeViewModel());
  gh.factory<_i5.LoginModel>(() => retrofitModule.loginModel());
  gh.factory<_i6.LoginViewModel>(() => _i6.LoginViewModel());
  gh.factory<_i7.SplashModel>(() => _i7.SplashModel());
  gh.factory<_i8.SplashViewModel>(() => _i8.SplashViewModel());
  return get;
}

class _$RetrofitModule extends _i9.RetrofitModule {}
