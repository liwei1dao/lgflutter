import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lgflutter/page/home/home_view.dart';
import 'package:lgflutter/page/login/login_view.dart';
import 'package:lgflutter/page/splash/splash_view.dart';
import 'package:lgflutter/widgets/page_route_anim.dart';

class RouteName {
  static const String splash = 'splash';
  static const String login = 'login';
  static const String home = 'home';
}

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashView());
      case RouteName.login:
        return NoAnimRouteBuilder(LoginView());
      case RouteName.home:
        return NoAnimRouteBuilder(HomeView());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
