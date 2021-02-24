import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';
import 'package:trko_task2/app/modules/RegisterScreen/views/register_screen_view.dart';
import 'package:trko_task2/app/widgets/button_widgets.dart';
import 'package:trko_task2/app/widgets/logo_widget.dart';
import 'package:trko_task2/app/widgets/textformfield_widgets.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginScreenController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Logo
              Logo(),

              // Form
              Obx(()=> Form(
                  key: Get.find<LoginScreenController>().formKey.value,
                  child: Column(
                    children: [
                      // Email label
                      Container(
                          margin: EdgeInsets.only(
                              left: scale_width(1.0),
                              bottom: scale_height(17.0),
                              right: scale_width(289.0)),
                          width: scale_width(47.0),
                          height: scale_height(16.0),
                          child: TextFormFieldLabel(
                            label: 'Email',
                          )),

                      // Email input field
                      Container(
                        width: scale_width(337.0),
                        margin: EdgeInsets.only(
                            bottom: scale_height(36.0)),
                        child: TextFormField(
                          controller: Get.find<LoginScreenController>().emailcontroller,
                          validator: (val)=> val.isNotEmpty && GetUtils.isEmail(val)? null: 'Invalid email address',
                         onSaved: (val){
                            Get.find<LoginScreenController>().email = val.obs;
                          },
                          textInputAction: TextInputAction.next,
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
                        margin: EdgeInsets.only(
                            left: scale_width(1.0),
                            bottom: scale_height(17.0),
                            right: scale_width(250.0)),
                        width: scale_width(86.0),
                        height: scale_height(16.0),
                        child: TextFormFieldLabel(
                          label: 'Password',
                        ),
                      ),

                      // Password input field
                      Container(
                        width: scale_width(337.0),
                        margin: EdgeInsets.only(
                            bottom: scale_height(38.0)),
                        child: TextFormField(
                          validator: (val)=> val.isEmpty? 'Enter Password': null,
                          onSaved: (val){
                            Get.find<LoginScreenController>().password = val.obs;
                          },
                          controller: Get.find<LoginScreenController>().passwordcontroller,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: scale_height(17.0), horizontal: scale_width(13.0)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                      ),
                      
                      // Login Button
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: scale_height(90.0)),
                        child: PrimaryButton(
                          label: 'Login',
                          width: 47.0,
                          function: Get.find<LoginScreenController>().validate,
                        ),
                      ),

                      // Register Link #correct structure
                      GestureDetector(
                          onTap: () {
                            Get.offAll(() => RegisterScreen());
                          },
                          child: LinkButton(
                            label: 'Register',
                            width: 72.0,
                          ))
                    ],
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
