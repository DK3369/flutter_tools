import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nine_headimage_controller.dart';

class NineHeadimageView extends GetView<NineHeadimageController> {
  const NineHeadimageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NineHeadimageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NineHeadimageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
