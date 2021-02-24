import 'package:get/get.dart';

import '../controllers/add_project_screen_controller.dart';

class AddProjectScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProjectScreenController>(
      () => AddProjectScreenController(),
    );
  }
}
