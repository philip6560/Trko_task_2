import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trko_task2/app/modules/EditProjectScreen/views/edit_project_screen_view.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';

class ProjectCard extends StatelessWidget {
  
  final project_id;
  final String token;
  final String category_id;
  final List  category_List;
  final String title;
  final String description;
  final Function delete_project;

  ProjectCard({this.project_id, this.title, this.description, this.delete_project, this.category_id, this.token, this.category_List});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
      color: MyCustomColors.lightblue(),
      margin: EdgeInsets.only(bottom: scale_height(24.0), left: scale_width(31.0), right: scale_width(30.0)),
      elevation: 2.0,
      child: Container(
        width: scale_width(351.0),
        height: scale_height(96.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _leftpart(title: this.title, description: this.description),
            _rightpart(project_id: this.project_id, token: this.token, category_list: this.category_List, title: this.title, description: this.description, deleteProject: this.delete_project, category_id: this.category_id),

          ]
        ),
      ),
    );
  }
}


Widget _leftpart({String title, String description}){
  return Container(
    margin: EdgeInsets.only(left: scale_width(28.0), top: scale_height(20.0), bottom: scale_height(31.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: scale_width(1.0)),
          width: scale_width(89.0), height: scale_height(20.0),
          child: Text(title, style: (TextStyle(fontSize: scale_height(20.0))), )
        ),
        SizedBox(height: scale_height(9.0),),
        Container(
          width: scale_width(193.0), height: scale_height(16.0),
          child: Text(description, style: TextStyle(fontSize: scale_height(16.0)), overflow: TextOverflow.ellipsis,),
        ),
      ]
    ),
  );
}

Widget _rightpart({String project_id, String token, String title, String description, String category_id, List category_list, Function deleteProject}){

  var category_id_index;

  for(int i=0; i < category_list.length; i++){
    if(category_list[i].id == category_id){
      category_id_index = i;
      break;
    }
    else{
      continue;
    }
  }

  return Container(
    margin: EdgeInsets.only(top: scale_height(12.0), bottom: scale_height(25.0), right: scale_width(12.0)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // edit link
        Container(
          alignment: Alignment.center,
          width: scale_width(19.0), height: scale_height(16.0),
          child: GestureDetector(
            onTap: ()=> Get.offAll(()=> EditProjectScreen(), arguments: {'project_id': project_id, 'token': token, 

            'title': title, 'description': description, 'category_id': category_id, 
            
            'category_id_index': category_id_index, 'category_list': category_list}),

            child: Text('Edit', style: TextStyle(fontSize: scale_height(11.0), color: MyCustomColors.deepblue())),
          ),
        ),

        // delete icon
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: scale_width(1.0),),
          child: GestureDetector(
            onTap: deleteProject,
            child: Icon(Icons.delete)),
        ),
      ]
    ),
  );
}

