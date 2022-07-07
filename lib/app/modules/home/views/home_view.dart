import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

import '../../../Utils/widgets/sidebar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Row(children: [
          Expanded(
            flex: 2,
            child: Sidebar(),
          ),
          Expanded(
              flex: 15,
              child: Container(
                color: Colors.white,
              ))
        ]));
  }
}
