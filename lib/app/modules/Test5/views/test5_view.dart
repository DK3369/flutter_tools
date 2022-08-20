import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test5_controller.dart';

class Test5View extends GetView<Test5Controller> {
  const Test5View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test5View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Test5View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
