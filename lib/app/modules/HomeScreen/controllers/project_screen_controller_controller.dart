import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:trko_task2/app/data/api_calls.dart';
import 'package:trko_task2/app/data/models/categorys.dart';
import 'package:trko_task2/app/data/models/projects.dart';
import 'package:trko_task2/app/widgets/loading_widget.dart';

class ProjectScreenController extends GetxController {
  //TODO: Implement ProjectScreenController

  RxString token = ''.obs;
  TrkoApiProvider trkoApiProvider = TrkoApiProvider();
  var projectsList = List<UserProjects>().obs;
  var delete_result = ''.obs;
  var categoryList = List<Categories>().obs;
  var scrollController = ScrollController().obs;
  RxBool is_button_visible = true.obs;



    getCategory(String token)async{

      var categories = await trkoApiProvider.getCategories(token);
      print(categories);
      if(categories != null){
        categoryList.assignAll(categories);
      }else{
        categoryList.assign(categories);
      }

    }



    getProjects(String token)async{
      var projects = await trkoApiProvider.getProjects(token);
      print('projects: $projects');
      if (projects != null){
        projectsList.assignAll(projects);
      }else{
        projectsList.assign(UserProjects(id: null, status_code: null, description: null, title: null, category_id: null));
      }
    }




    deleteProject({String id, String project_name})async{
      print('$id, ${token.value}');
      // Get.defaultDialog();
      deleteDialog(
        // label for proceeding to delete project
        onConfirm_label: 'Yes', 
        
        // method to proceed to delete selected project
        onConfirm: ()async{ 
          Get.back(); 
          loading('Deleting project... ');
          delete_result.value = await trkoApiProvider.deleteProject(id, token.value);
          print('${delete_result.value}');

          if (delete_result.value != null){
            Get.back();
            loading(delete_result.value);
            await getProjects(token.value);
            Get.back();
          }else{
            print('else: i was here');
            Get.back();
            loading('Oops something went wrong could not delete, try again');
            await Future.delayed(Duration(seconds: 10));
            Get.back();
          }

          },

        // label for proceeding to delete project
        onCancel_label:'No', 

        // method to halt delete process
        onCancel: (){ 

          Get.back();
          },

        // name of the selected project to be deleted
        project_name: project_name);

    }



    hideButton(){
      if (scrollController.value.position.userScrollDirection == ScrollDirection.reverse){
        if(is_button_visible.value == true){
          is_button_visible.value = false;
        }
      }else if(scrollController.value.position.userScrollDirection == ScrollDirection.forward){
          if(is_button_visible.value == false){
            is_button_visible.value = true;
        }
      }
    }





  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getCategory(token.value);
    getProjects(token.value);
    hideButton();
    super.onReady();
  }

  @override
  void onClose() {}
}

