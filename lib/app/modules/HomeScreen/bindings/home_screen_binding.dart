import 'package:get/get.dart';

import 'package:trko_task2/app/modules/HomeScreen/controllers/project_screen_controller_controller.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectScreenController>(
      () => ProjectScreenController(),
    );
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
    );
  }
}
