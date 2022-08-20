import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test1_controller.dart';

class Test1View extends GetView<Test1Controller> {
  const Test1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test1View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Test1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
