import 'package:injectable/injectable.dart';
import 'package:lgflutter/base/base_view_model.dart';
import 'package:lgflutter/base/extension/object_ext.dart';
import 'package:lgflutter/manager/storage_manager.dart';

import 'login_model.dart';

@injectable
class LoginViewModel extends BaseViewModel<LoginModel> {
  @factoryMethod
  LoginViewModel();

  String loginName = "";
  String psw = "";

  void login() {
    if (loginName.isEmpty) {
      showToast("登录账号不可为空");
    } else if (psw.isEmpty) {
      showToast("登录密码不可为空");
    } else {
      sendRequest<LoginResult>(model.login(loginName, psw), (value) {
        if (value.errorCode == 0) {
          value.data?.let((it) {
            StorageManager.instance.user.uid = it.id ?? 0;
            StorageManager.instance.user.token = it.token ?? "";
            StorageManager.instance.user.userName = it.username ?? "";
          });
          // pop();
          // push(MainPage());
        } else {
          showToast(value.errorMsg!);
        }
      }, isNeedLoading: true);
    }
  }
}
