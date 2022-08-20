import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test4_controller.dart';

class Test4View extends GetView<Test4Controller> {
  const Test4View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test4View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Test4View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
