import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/Utils/styles/AppColors.dart';
import 'package:task_management_app/app/Utils/widgets/upcomingtask.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

import '../../../Utils/widgets/header.dart';
import '../../../Utils/widgets/sidebar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const Sidebar(),
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
                                      'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
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
                            ? BorderRadius.circular(30)
                            : BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'My Task',
                                  style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // My task
                                SizedBox(
                                  height: 200,
                                  child: ListView(
                                    clipBehavior: Clip.antiAlias,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    children: [
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                    backgroundColor:
                                                        Colors.amber,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.amber,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
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
                                                        color: AppColors
                                                            .primaryText,
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
                                                    color:
                                                        AppColors.primaryText,
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
                                              'Deadline 2 hari lagi',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                    backgroundColor:
                                                        Colors.amber,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.amber,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
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
                                                        color: AppColors
                                                            .primaryText,
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
                                                    color:
                                                        AppColors.primaryText,
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
                                              'Deadline 2 hari lagi',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                    backgroundColor:
                                                        Colors.amber,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.amber,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
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
                                                        color: AppColors
                                                            .primaryText,
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
                                                    color:
                                                        AppColors.primaryText,
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
                                              'Deadline 2 hari lagi',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                    backgroundColor:
                                                        Colors.amber,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
                                                  ),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.amber,
                                                    radius: 20,
                                                    foregroundImage: NetworkImage(
                                                        'https://pbs.twimg.com/profile_images/1539609458514358272/VeuA18MI_400x400.jpg'),
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
                                                        color: AppColors
                                                            .primaryText,
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
                                                    color:
                                                        AppColors.primaryText,
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
                                              'Deadline 2 hari lagi',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                const UpcomingTask(),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'My Friends',
                                            style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 25),
                                          ),
                                          Text(
                                            'More',
                                            style: TextStyle(
                                                color: AppColors.primaryText,
                                                fontSize: 25),
                                          ),
                                          Icon(
                                            Ionicons.arrow_forward,
                                            color: AppColors.primaryText,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // content / isi page / screen
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
