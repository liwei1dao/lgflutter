import 'package:injectable/injectable.dart';
import 'package:lgflutter/base/base_view_model.dart';

import 'home_model.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {
  @factoryMethod
  HomeViewModel();

  String loginName = "";
  String psw = "";
}
