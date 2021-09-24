import 'package:flutter/cupertino.dart';
import 'package:lgflutter/base/toast/toast_mixin.dart';

import 'base_view_model.dart';
import 'inject/injector.dart';

abstract class BaseView<W extends StatefulWidget, VM extends BaseViewModel>
    extends State<W> with ToastMixin {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<VM>();
    viewModel.context = context;
    viewModel.init();
  }
}
