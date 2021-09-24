import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lgflutter/base/base_view.dart';
import 'package:lgflutter/manager/storage_manager.dart';

import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseView<LoginView, LoginViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              top: 40,
              left: 10,
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/images/round_arrow_forward_left.png",
                  width: 20,
                  height: 20,
                ),
              )),
          Positioned(
              top: 100,
              child: Text("账号登录",
                  style: TextStyle(color: Colors.white, fontSize: 25))),
          Positioned(
            top: 200,
            child: Container(
              height: 60,
              width: 300,
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 15),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Color(0x30cccccc),
                    filled: true,
                    hintText: StorageManager.instance.user.userName.isEmpty
                        ? "请输入登录账号"
                        : StorageManager.instance.user.userName,
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(100)))),
                onChanged: (text) {
                  viewModel.loginName = text;
                },
              ),
            ),
          ),
          Positioned(
              top: 280,
              child: Container(
                height: 60,
                width: 300,
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  decoration: InputDecoration(
                      hintText: "请输入登录密码",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(100)))),
                  onChanged: (text) {
                    viewModel.psw = text;
                  },
                ),
              )),
          Positioned(
            top: 420,
            child: Container(
              width: 230,
              height: 50,
              alignment: Alignment.center,
              child: ConstrainedBox(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  onPressed: () {
                    viewModel.login();
                  },
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                constraints: new BoxConstraints.expand(),
              ),
            ),
          ),
          Positioned(
              top: 480,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "注册",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ))
        ],
      ),
    );
  }
}
