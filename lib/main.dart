import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';

import 'app/routes/app_pages.dart';

void main() {
  
  runApp(
    GetMaterialApp(
      title: "Trko",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyCustomColors.blue(),
        scaffoldBackgroundColor: Colors.white,
        cursorColor: MyCustomColors.blue(),
      ),
    ),
  );
}

