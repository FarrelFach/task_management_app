import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/uji_controller.dart';

class UjiView extends GetView<UjiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UjiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UjiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
