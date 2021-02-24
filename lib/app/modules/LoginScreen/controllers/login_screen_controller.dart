import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trko_task2/app/data/api_calls.dart';
import 'package:trko_task2/app/data/models/users.dart';
import 'package:trko_task2/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:trko_task2/app/modules/RegisterScreen/views/register_screen_view.dart';
import 'package:trko_task2/app/widgets/loading_widget.dart';
import 'package:trko_task2/app/widgets/snackbar.dart';

class LoginScreenController extends GetxController {
  //TODO: Implement LoginScreenController

  var formKey = GlobalKey<FormState>().obs;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  RxString email;
  RxString password;
  User user;
  TrkoApiProvider trkoApiProvider = TrkoApiProvider();


   goto_register_screen(){

    return Get.offAll(()=> RegisterScreen());
  }

  validate() async{
    if(formKey.value.currentState.validate()){
      formKey.value.currentState.save();
      user = User(email: email.value, password: password.value);
      
      loading('Please wait...');
      Map result = await trkoApiProvider.login(user);

      if(result['status_code'].toString() == '200'){
        Get.back(closeOverlays: true);
        loading(result['message']);
        var token = result['token'].toString();
        await Future.delayed(Duration(seconds: 2));
        Get.offAll(()=> HomeScreen(), arguments: token );
      }
      else{
        Get.back();
        return snackbarResponse(result['error']);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
