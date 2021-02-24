import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trko_task2/app/data/api_calls.dart';
import 'package:trko_task2/app/data/models/categorys.dart';
import 'package:trko_task2/app/modules/HomeScreen/controllers/home_screen_controller.dart';
import 'package:trko_task2/app/modules/HomeScreen/controllers/project_screen_controller_controller.dart';
import 'package:trko_task2/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:trko_task2/app/widgets/loading_widget.dart';

class AddProjectScreenController extends GetxController {
  //TODO: Implement AddProjectScreenController

  final formKey = GlobalKey<FormState>().obs;
  RxString token = ''.obs;
  TrkoApiProvider trkoApiProvider = TrkoApiProvider();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  var title_focus_node = FocusNode().obs;
  var description_focus_node = FocusNode().obs;
  var categoryList = List<Categories>().obs;
  var selected_category = RxInt();
  var selected_category_id = ''.obs;
  var title = ''.obs;
  var description = ''.obs;
  var currentIndex = 0.obs;


  selected(int index){
    currentIndex.value = index;
    Get.find<HomeScreenController>().currentIndex.value = index;
    Get.offAll(HomeScreen(), arguments: token.value);
  }

    currentItem(value){

      selected_category_id.value = categoryList[value].id;
      print('${categoryList[value].id}');

      selected_category.value = value;

    }

  addProject()async{
    if(formKey.value.currentState.validate()){
        formKey.value.currentState.save();

        print('${title.value}, ${description.value}, ${selected_category_id.value}, ${token.value}');
      loading('Please wait, creating project...');
      var result = await trkoApiProvider.addProject(title: title.value, description: description.value, category: selected_category_id.value, token: token.value);// token yet to be parsed

      if(result != null){
        print('adding');

        Get.back();
        loading(result);
        await Get.find<ProjectScreenController>().getProjects(token.value);
        await Future.delayed(Duration(seconds: 1));
        Get.back();
      }
      else{
        print('or i came here');
        Get.back();
        loading('Oops could not add project, try again.');
        await Future.delayed(Duration(seconds: 2));
        Get.back();
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
