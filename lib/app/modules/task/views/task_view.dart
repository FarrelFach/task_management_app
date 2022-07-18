import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/Utils/styles/AppColors.dart';
import 'package:task_management_app/app/Utils/widgets/header.dart';
import 'package:task_management_app/app/Utils/widgets/sidebar.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 150, child: const Sidebar()),
      backgroundColor: AppColors.primaryBg,
      body: SafeArea(
        child: Row(
          children: [
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: Sidebar(),
                  )
                : const SizedBox(),
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const header()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Task Management',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                  Text(
                                    'Manage task easy with friends',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryText,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Ionicons.notifications,
                                color: AppColors.primaryText,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: const CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  radius: 25,
                                  foregroundImage: NetworkImage(
                                      'https://i.imgur.com/APmrQQB.jpeg'),
                                ),
                              ),
                            ],
                          ),
                        ),
                  // content / isi page / screen
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.all(30)
                          : const EdgeInsets.all(20),
                      margin: !context.isPhone
                          ? const EdgeInsets.all(10)
                          : const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: !context.isPhone
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Task',
                            style: TextStyle(
                                color: AppColors.primaryText, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: ListView.builder(
                              clipBehavior: Clip.antiAlias,
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.cardBg,
                                  ),
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: const CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              radius: 20,
                                              foregroundImage: NetworkImage(
                                                  'https://i.imgur.com/APmrQQB.jpeg'),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            child: const CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              radius: 20,
                                              foregroundImage: NetworkImage(
                                                  'https://i.imgur.com/APmrQQB.jpeg'),
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 25,
                                            width: 80,
                                            color: AppColors.primaryBg,
                                            child: const Center(
                                              child: Text(
                                                '100 %',
                                                style: TextStyle(
                                                  color: AppColors.primaryText,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        color: AppColors.primaryBg,
                                        child: const Center(
                                          child: Text(
                                            '10 / 10 Task',
                                            style: TextStyle(
                                              color: AppColors.primaryText,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Pemrograman Mobile',
                                        style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 20),
                                      ),
                                      const Text(
                                        'Deadline hari ini',
                                        style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
          onPressed: () {
            Get.bottomSheet(Container(
              margin: context.isPhone
                  ? EdgeInsets.zero
                  : EdgeInsets.only(left: 150, right: 150),
              height: Get.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
            ));
          },
          label: Text("Add Task"),
          icon: Icon(Ionicons.add_circle_outline),
        ),
      ),
    );
  }
}
