import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trko_task2/app/modules/AddProjectScreen/views/add_project_screen_view.dart';
import 'package:trko_task2/app/modules/HomeScreen/controllers/project_screen_controller_controller.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';
import 'package:trko_task2/app/widgets/loading_widget.dart';
import 'package:trko_task2/app/widgets/projects_card_template.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {

    HomeScreenController homeScreenController =  Get.put(HomeScreenController(), permanent: true);
    
    // token is gotten as an argument from login or register screen
    Get.find<HomeScreenController>().token.value = Get.arguments;
    
    return Scaffold(
      body: Obx(()=> Get.find<HomeScreenController>().children[Get.find<HomeScreenController>().currentIndex.value]),
      bottomNavigationBar: Obx(()=> Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
              style: BorderStyle.solid,
              width: 1.1,
            )),
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: MyCustomColors.blue(),
              selectedFontSize: scale_height(13.0),
              unselectedFontSize: scale_height(12.0),
              iconSize: scale_height(24.0),
              onTap: Get.find<HomeScreenController>().selected,
              currentIndex: Get.find<HomeScreenController>().currentIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.credit_card_rounded), label: 'Payments'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_outlined), label: 'Contact Us'),
              ],
            ),
          ),
      ),
    );
  }
}



class Projects extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ProjectScreenController projectScreenController = Get.put(ProjectScreenController(), permanent: true);

    // token passed from the homeScreenController
    projectScreenController.token.value = Get.find<HomeScreenController>().token.value;

    // projectScreenController.scrollController = ScrollController();
    // projectScreenController.scrollController.addListener((){  projectScreenController.hideButton();  });

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: scale_width(69.0), height: scale_height(16.0),
          child: Text('Projects', style: TextStyle(color: Colors.white, fontSize: scale_height(20.0)),)),
      ),
      body: Obx(()=> projectScreenController.projectsList.isEmpty ? 

      // displays while api call is yet to return a response
      loadingProjects('Fectching your projects, please wait...') : 

      // once a response is gotten, we'd evaluate to see if the status code is null
      projectScreenController.projectsList[0].id == null? 

      // if the status code is null user will be asked to refresh the page
      refreshProjectScreen('Oops! something went wrong, unable to fetch your projects', projectScreenController.token.value):

      // else the user's list of project would be displayed
      Container(
        padding: EdgeInsets.only(top: scale_height(14.0),),
        child: ListView.builder(
          shrinkWrap: true,
          controller: projectScreenController.scrollController.value,
          itemCount: projectScreenController.projectsList.length,
          itemBuilder: (context, index){
              return ProjectCard(

              // project id
              project_id: projectScreenController.projectsList[index].id,

              // authorization token
              token: projectScreenController.token.value,

              // value of title
              title: projectScreenController.projectsList[index].title, 

              // value of description
              description: projectScreenController.projectsList[index].description,

              // delete project function being passed
              delete_project: ()=> projectScreenController.deleteProject(
                id: projectScreenController.projectsList[index].id,
                project_name: projectScreenController.projectsList[index].title),

                // value of the category_id for a specific project
                category_id: projectScreenController.projectsList[index].category_id,
                
                // list of the category_id for a specific project
                category_List: projectScreenController.categoryList,);
          }
          ),
      ),),

      floatingActionButton: Obx(()=>
        Visibility( visible: projectScreenController.is_button_visible.value,
          child: FloatingActionButton(
            backgroundColor: MyCustomColors.blue(),
            onPressed: (){  Get.offAll(()=> AddProjectScreen(), arguments: {'token': projectScreenController.token.value, 'categories': projectScreenController.categoryList});  },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );  
  }
}
