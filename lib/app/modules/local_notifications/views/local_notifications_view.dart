import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/local_notifications_controller.dart';

class LocalNotificationsView extends GetView<LocalNotificationsController> {
  const LocalNotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocalNotificationsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LocalNotificationsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
