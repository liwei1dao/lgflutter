import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lgflutter/base/base_view.dart';

import 'component/home_drawer.dart';
import 'component/home_videogroup.dart';
import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends BaseView<HomeView, HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LgFlutter"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      drawer: HomeDrawer(), //抽屉
      body: Row(
        children: [
          HomeVideoGroup(
            groupname: '电影',
            videotype: 1,
          ),
        ],
      ),
    );
  }
}
