import 'package:get/get.dart';

import '../controllers/edit_project_screen_controller.dart';

class EditProjectScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProjectScreenController>(
      () => EditProjectScreenController(),
    );
  }
}
