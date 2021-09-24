import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:lgflutter/base/toast/toast_mixin.dart';

import 'inject/injector.dart';

abstract class BaseViewModel<M extends Object> extends ChangeNotifier
    with ToastMixin {
  late BuildContext context;
  late M model;
  bool _isDispose = false;
  bool get isDispose => _isDispose;
  int needLoadingRequestCount = 0;
  bool isLoading = false;
  Function()? showLoadingFun;
  Function? dismissLoadingFun;
  static bool isNeedCatchError = false;

  void init() {
    model = getIt.get<M>();
  }

  void showLoading(bool isNeedLoading) {
    if (isNeedLoading) {
      needLoadingRequestCount++;
      if (!isLoading) {
        isLoading = true;
        showLoadingFun?.call();
      }
    }
  }

  void dismissLoading(bool isNeedLoading) {
    if (isNeedLoading) {
      needLoadingRequestCount--;
      if (needLoadingRequestCount == 0) {
        isLoading = false;
        dismissLoadingFun?.call();
      }
    }
  }

  /// 发起网络请求，同时处理异常，loading
  void sendRequest<T>(Future<T> future, FutureOr<dynamic> onValue(T value),
      {Function(Exception e)? error, bool isNeedLoading = false}) {
    showLoading(isNeedLoading);
    future.then((t) {
      dismissLoading(isNeedLoading);
      onValue(t);
    });
    if (isNeedCatchError) {
      future.catchError((e) {
        dismissLoading(isNeedLoading);
        print("====>error:$e");
        if (error != null) {
          error(e);
        }
      });
    }
  }
}
