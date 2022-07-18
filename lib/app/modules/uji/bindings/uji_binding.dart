import 'package:get/get.dart';

import '../controllers/uji_controller.dart';

class UjiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UjiController>(
      () => UjiController(),
    );
  }
}
