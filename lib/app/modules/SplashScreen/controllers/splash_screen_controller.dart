import 'package:get/get.dart';
import 'package:trko_task2/app/modules/LoginScreen/views/login_screen_view.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  Future loading()async{
    await Future.delayed(Duration(seconds: 2));
    await Get.offAll(()=> LoginScreen(),);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loading();
  }

  @override
  void onClose() {}
}
