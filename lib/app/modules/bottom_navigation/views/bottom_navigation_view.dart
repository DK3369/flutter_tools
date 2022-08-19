import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/app/modules/home/views/home_view.dart';
import 'package:flutter_tools/app/modules/mine/views/mine_view.dart';
import 'package:flutter_tools/app/modules/movies/views/movies_view.dart';
import 'package:flutter_tools/app/modules/news/views/news_view.dart';
import 'package:get/get.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  const BottomNavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                NewsView(),
                MoviesView(),
                MineView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: '首页',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.sportscourt,
                label: '新闻',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.bell,
                label: '视频',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: '我的',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}

// int _currentIndex = 0;
//
// List<Widget> _pageList = [
//   HomeView(), //页面1
//   MineView(), //页面2
//   NewsView(), //页面3
// ];
//
// List<BottomNavigationBarItem> bottomItems = [
//   const BottomNavigationBarItem(
//     icon: Icon(Icons.home, color: Colors.black54),
//     activeIcon: Icon(Icons.home, color: Colors.red),
//     label: "首页",
//     // Text("首页", style: TextStyle(fontSize: 12))
//   ),
//   const BottomNavigationBarItem(
//     icon: Icon(Icons.video_call_rounded, color: Colors.black54),
//     activeIcon: Icon(Icons.video_call_rounded, color: Colors.red),
//     // title: Text("西瓜视频", style: TextStyle(fontSize: 12))
//     label: "新闻",
//   ),
//   const BottomNavigationBarItem(
//     icon: Icon(Icons.account_circle_rounded, color: Colors.black54),
//     activeIcon: Icon(Icons.account_circle_rounded, color: Colors.red),
//     // title: Text("我的", style: TextStyle(fontSize: 12))
//     label: "我的",
//   )
// ];
