import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/data/controller/auth.controller.dart';

class TaskController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? _userCredential;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final authCon = Get.find<AuthController>();
  late TextEditingController titleController,
      descriptionController,
      dueDateController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dueDateController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    dueDateController.dispose();
  }

  void increment() => count.value++;

  void saveUpdateTask(
    String? title,
    String? description,
    String? dueDate,
    String? docId,
    String? type,
  ) async {
    print(title);
    print(description);
    print(dueDate);
    print(docId);
    print(type);
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formkey.currentState!.save();
    CollectionReference taskColl = firestore.collection('task');
    CollectionReference usersColl = firestore.collection('users');
    var taskId = DateTime.now().toIso8601String();
    if (type == 'Add') {
      await taskColl.doc(taskId).set({
        'title': title,
        'description': description,
        'due_date': dueDate,
        'status': '0',
        'total_task': '0',
        'total_task_finished': '0',
        'task_detail': [],
        'asign_to': [authCon.auth.currentUser!.email],
        'created_by': authCon.auth.currentUser!.email,
      }).whenComplete(() async {
        await usersColl.doc(authCon.auth.currentUser!.email).set({
          'task_id': FieldValue.arrayUnion([taskId])
        }, SetOptions(merge: true));
        Get.back();
        Get.snackbar('Task', 'Successfully $type');
      }).catchError((error) {
        Get.snackbar('Task', 'Error $type');
      });
    } else {
      await taskColl.doc(docId).update({
        'title': title,
        'description': description,
        'due_date': dueDate,
      }).whenComplete(() async {
        // await usersColl.doc(authCon.auth.currentUser!.email).set({
        //   'task_id': FieldValue.arrayUnion([taskId])
        // }, SetOptions(merge: true));
        Get.back();
        Get.snackbar('Task', 'Successfully $type');
      }).catchError((error) {
        Get.snackbar('Task', 'Error $type');
      });
    }
  }
  void deleteTask(String taskId) async {
    CollectionReference taskColl = firestore.collection('task');
    CollectionReference usersColl = firestore.collection('users');

    await taskColl.doc(taskId).delete().whenComplete(() async {
      await usersColl.doc(auth.currentUser!.email).set({
        'task_id': FieldValue.arrayRemove([taskId])
      }, SetOptions(merge: true));
    });
    Get.back();
    Get.snackbar('Task', 'Successfully deleted');
  }
}
