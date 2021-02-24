import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trko_task2/app/data/api_calls.dart';
import 'package:trko_task2/app/data/models/users.dart';
import 'package:trko_task2/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:trko_task2/app/widgets/loading_widget.dart';
import 'package:trko_task2/app/widgets/snackbar.dart';


class RegisterScreenController extends GetxController {
  //TODO: Implement RegisterScreenController

  final formKey = GlobalKey<FormState>().obs;
  var message = 'Please wait...'.obs;
  RxString email;
  RxString password;
  RxString retypepassword;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController retyperpasswordcontroller = TextEditingController();
  TrkoApiProvider trkoApiProvider = TrkoApiProvider();

  
  create()async{
    if(formKey.value.currentState.validate()){
      formKey.value.currentState.save();
      print('email:$email, password:$password, ${emailcontroller.value.text}');
      User user = User(email: email.value, password: password.value,);
    
      loading(message.value);
      // register user 
      Map result = await trkoApiProvider.register(user);
      print('$result');
      if(result['status_code'] == 200){
        message.value = result['message'];
        loading(message.value);
        await Future.delayed(Duration(seconds: 2));
        emailcontroller.clear();
        passwordcontroller.clear();
        retyperpasswordcontroller.clear();
        Get.offAll(()=> HomeScreen(), arguments: result['token']);
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
