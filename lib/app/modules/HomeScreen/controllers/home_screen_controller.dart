import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trko_task2/app/data/api_calls.dart';
import 'package:trko_task2/app/data/models/projects.dart';
import 'package:trko_task2/app/modules/ContactScreen/views/contact_screen_view.dart';
import 'package:trko_task2/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:trko_task2/app/widgets/loading_widget.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  RxInt currentIndex = 0.obs;
  var token = ''.obs;
  TrkoApiProvider trkoApiProvider = TrkoApiProvider();
  var projectsList = List<UserProjects>().obs;
  var delete_result = ''.obs;


  
  RxList<Widget> children = [
      Projects(),
      Container(),
      ContactScreen(),
    ].obs;


  selected(int index){
    currentIndex.value = index;
  }

  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // getProjects(token.value);
  }

  @override
  void onClose() {}
}
