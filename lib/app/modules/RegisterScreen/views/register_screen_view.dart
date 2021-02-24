import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';
import 'package:trko_task2/app/modules/LoginScreen/views/login_screen_view.dart';
import 'package:trko_task2/app/widgets/button_widgets.dart';
import 'package:trko_task2/app/widgets/logo_widget.dart';
import 'package:trko_task2/app/widgets/textformfield_widgets.dart';

import '../controllers/register_screen_controller.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> RegisterScreenController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Logo
              Logo(),

              // form
              Container(
                child: Obx(
                  ()=> Form(
                    key: Get.find<RegisterScreenController>().formKey.value,
                    child: Column(
                      children: [
                        // Email field label
                        Container(
                            margin: EdgeInsets.only(left: scale_width(1.0), bottom: scale_height(17.0), right: scale_width(289.0)),
                            width: scale_width(47.0),
                            height: scale_height(16.0),
                            child: TextFormFieldLabel(label: 'Email',)),

                            // Email input field
                        Container(
                          width: scale_width(337.0),
                          margin: EdgeInsets.only(bottom: scale_height(36.0)),
                          child: TextFormField(
                            controller: Get.find<RegisterScreenController>().emailcontroller,
                            textInputAction: TextInputAction.next,
                            validator: (val)=> val.isNotEmpty && GetUtils.isEmail(val)? null: 'Invalid email address',
                           onSaved: (val){
                              Get.find<RegisterScreenController>().email = val.obs;
                            },
                            autofocus: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: scale_height(17.0), horizontal: scale_width(13.0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                          ),
                        ),

                        // Password field label
                        Container(
                          margin: EdgeInsets.only(left: scale_width(1.0), bottom: scale_height(17.0), right: scale_width(250.0)),
                          width: scale_width(86.0),
                          height: scale_height(16.0),
                          child: TextFormFieldLabel(label: 'Password',),
                        ),

                        // Password input field
                        Container(
                          width: scale_width(337.0),
                          margin: EdgeInsets.only(bottom: scale_height(32.0)),
                          child: TextFormField(
                            controller: Get.find<RegisterScreenController>().passwordcontroller,
                            textInputAction: TextInputAction.next,
                            validator: (val)=> val.isEmpty? 'Enter Password': null,
                            onSaved: (val){
                              Get.find<RegisterScreenController>().password = val.obs;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: scale_height(17.0), horizontal: scale_width(13.0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                          ),
                        ),

                        // Re-type password label
                        Container(
                          margin: EdgeInsets.only(left: scale_width(1.0), bottom: scale_height(13.0), right: scale_width(184.0)),
                          width: scale_width(152.0),
                          height: scale_height(20.0),
                          child: TextFormFieldLabel(label: 'Retype Password',),
                        ),

                        // Re-type password input field
                        Container(
                          width: scale_width(337.0),
                          margin: EdgeInsets.only(bottom: scale_height(32.0,)),
                          child: TextFormField(
                            controller: Get.find<RegisterScreenController>().retyperpasswordcontroller,
                            validator: (val)=>  val.isNotEmpty && val.toString() == Get.find<RegisterScreenController>().passwordcontroller.value.text ? null: 'Incorrect Password',
                            onFieldSubmitted: (val)=> val.isNotEmpty && val.toString() == Get.find<RegisterScreenController>().passwordcontroller.value.text ? null: 'Incorrect Password',
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: scale_height(17.0), horizontal: scale_width(13.0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                          ),
                        ),

                        // Register Button
                        Padding(
                          padding: EdgeInsets.only(bottom: scale_height(61.0,)),
                          child: PrimaryButton(label: 'Register', width: 72.0, function: Get.find<RegisterScreenController>().create),
                        ),
                        
                        // Login link
                        GestureDetector(
                          onTap: (){
                            Get.offAll(()=> LoginScreen());
                          },
                          child: LinkButton(label: 'Login', width: 47.0,))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
