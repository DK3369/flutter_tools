import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_main_controller.dart';

class ListMainView extends GetView<ListMainController> {
  const ListMainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListMainView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListMainView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
