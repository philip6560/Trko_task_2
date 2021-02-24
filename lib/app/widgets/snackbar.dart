

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';

snackbarResponse(String message){
  return Get.snackbar(
          '',
          '',
          messageText: Text('$message', style: TextStyle(fontSize: scale_height(19.0), color: Colors.white,)),
          backgroundColor: MyCustomColors.blue(),
          duration: Duration(seconds: 4),
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.only(bottom: 5.0, top:0.0, left: 19.0, right: 5.0),
          borderRadius: 0.0,
        );
}