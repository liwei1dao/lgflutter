import 'package:flutter/material.dart';
import 'base/dio/dio.dart';
import 'base/inject/injector.dart';
import 'manager/router_manger.dart';
import 'manager/storage_manager.dart';

void main() {
  StorageManager.instance.init();
  configureDependencies();
  initRestClient();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LgFlutter",
      onGenerateRoute: RouterManager.generateRoute,
      initialRoute: RouteName.splash,
    );
  }
}
