import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test3_controller.dart';

class Test3View extends GetView<Test3Controller> {
  const Test3View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test3View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Test3View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
