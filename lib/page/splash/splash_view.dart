import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lgflutter/base/base_view.dart';
import 'package:lgflutter/manager/router_manger.dart';

import 'splash_view_model.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends BaseView<SplashView, SplashViewModel> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: new Duration(seconds: 1),
      child: FlareActor(
        "assets/assets/Teddy.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "success",
        callback: (name) {
          print("动画结束 $name ");
          Navigator.of(context).pushReplacementNamed(RouteName.home);
        },
      ),
    );
  }
}
