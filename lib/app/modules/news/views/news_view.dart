import 'package:flutter/material.dart';
import 'package:flutter_tools/app/modules/widgets/animation_text.dart';
import 'package:get/get.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("Snackbar 标题", "欢迎使用Snackbar");
                },
                child: Text("显示 Snackbar")),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog();
                },
                child: Text("显示 Dialog")),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.wb_sunny_outlined),
                          title: Text("白天模式"),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text("黑夜模式"),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        )
                      ],
                    ),
                  ));
                },
                child: Text("Bottom Sheet")),
            ElevatedButton(
                onPressed: () {
                  print("1");
                },
                child: Text("调用原生方法")),
            ElevatedButton(
                onPressed: () {
                  print("调用socket5");
                  controller.testApi();
                },
                child: Text("调用socket5")),
            ElevatedButton(
                onPressed: () {
                  print("调用testSocks5_2");
                  controller.testSocks5_2();
                },
                child: Text("调用testSocks5_2")),

            // TextAnimationPage
            // child: Text("调用IKEv2")),

            ElevatedButton(
                onPressed: () {
                  print("调用 TextAnimationPage");
                  Get.to(TextAnimationPage(), arguments: {"content": "content11", "dd": "tt"})
                      ?.then((value) => {});
                },
                child: Text("文字动画")),
          ],
        ),

        // child: Text(
        //   'NewsView is working',
        //   style: TextStyle(fontSize: 20),
        // ),
      ),
    );
  }
}
