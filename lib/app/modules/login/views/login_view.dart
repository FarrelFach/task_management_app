import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Container(
        margin: EdgeInsets.all(Get.height * 0.1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.white),
        child: Row(
          // biru

          children: [
            !context.isPhone
                ? Expanded(
                    child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                        color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Welcome",
                            style: TextStyle(color: Colors.white, fontSize: 70),
                          ),
                          Text(
                            "Please Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            "Start Journey With Us",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ))
                : const SizedBox(),
            //putih
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Images/login.png',
                    height: Get.height * 0.5,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    label: const Text('Sign In with Google'),
                    icon: const Icon(
                      Ionicons.logo_google,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
