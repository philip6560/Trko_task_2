import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';
import 'package:trko_task2/app/widgets/button_widgets.dart';
import 'package:trko_task2/app/widgets/textformfield_widgets.dart';

import '../controllers/edit_project_screen_controller.dart';

class EditProjectScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    
  EditProjectScreenController editProjectScreenController = Get.put(EditProjectScreenController());
  
    editProjectScreenController.project_id.value = Get.arguments['project_id'];
    editProjectScreenController.token.value = Get.arguments['token'];
    editProjectScreenController.titlecontroller.text = Get.arguments['title'];
    editProjectScreenController.descriptioncontroller.text = Get.arguments['description'];
    editProjectScreenController.selected_category_id.value = Get.arguments['category_id'];
    editProjectScreenController.selected_category.value = Get.arguments['category_id_index'];
    editProjectScreenController.categoryList = Get.arguments['category_list'];


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Container(
          margin: EdgeInsets.only(left: scale_width(31.0), top: scale_height(23.0), bottom: scale_height(18.0)),
          width: scale_width(103.0),
          height: scale_height(20.0),
          child: Text('Edit Project', style: TextStyle(fontSize: 20.0, color: Colors.white),),),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Obx(()=> Form(
              key: Get.find<EditProjectScreenController>().formKey.value,
              child: Column(
                children: [
                  // Title field label
                  Container(
                      margin: EdgeInsets.only(left: scale_width(32.0), bottom: scale_height(13.0), top: scale_height(47.0), right: scale_width(275.0)),
                      width: scale_width(105.0),
                      height: scale_height(20.0),
                      child: TextFormFieldLabel(label: 'Project Title',)),
                  
                  // Title input field
                  Container(
                    width: scale_width(349.0),
                    height: scale_height(52.0),
                    margin: EdgeInsets.only(bottom: scale_height(35.0)),
                    child: TextFormField(
                      focusNode: editProjectScreenController.title_focus_node.value,
                      controller: editProjectScreenController.titlecontroller,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                       validator: (val)=> val.isNotEmpty? null: 'Enter a title please',
                      onSaved: (val){   editProjectScreenController.title.value = val;  },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),

                  // Description field label
                  Container(
                    margin: EdgeInsets.only(left: scale_width(32.0), bottom: scale_height(13.0), right: scale_width(213.0)),
                    width: scale_width(167.0),
                    height: scale_height(20.0),
                    child: TextFormFieldLabel(label: 'Project Description',),
                  ),

                  // Description input field
                  Container(
                    width: scale_width(349.0),
                    height: scale_height(274.0),
                    margin: EdgeInsets.only(bottom: scale_height(35.0)),
                    child: TextFormField(
                      controller: editProjectScreenController.descriptioncontroller,
                      focusNode: editProjectScreenController.description_focus_node.value,
                      maxLines: 60,
                      textInputAction: TextInputAction.newline,
                      validator: (val)=> val.isNotEmpty? null: 'Enter a description please',
                      onSaved: (val){   editProjectScreenController.description.value = val;  },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),

                  // Project category dropdown menu label
                  Container(
                    margin: EdgeInsets.only(left: scale_width(32.0), bottom: scale_height(13.0), right: scale_width(233.0)),
                    width: scale_width(147.0),
                    height: scale_height(20.0),
                    child: TextFormFieldLabel(label: 'Project Category',),
                  ),

                  // Project category dropdown menu
                  Container(
                    margin: EdgeInsets.only(bottom: scale_height(32.0)),
                    height: scale_height(52.0),
                    width: scale_width(349.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,),
                    ),
                    child: DropdownButton(
                      underline: Container(),
                      onTap: (){  
                          editProjectScreenController.title_focus_node.value.unfocus(); 
                          editProjectScreenController.description_focus_node.value.unfocus();  
                       },
                      hint: Container(
                          margin: EdgeInsets.only(left: scale_width(10.0) ),
                          height: scale_height(18.0),
                          width: scale_width(126.0),
                          child: Text('Select Category', style: TextStyle(fontSize: scale_height(18.0)),)),
                      isExpanded: true,
                      onChanged: editProjectScreenController.currentItem,
                      value: editProjectScreenController.selected_category.value,
                      items: List.generate(editProjectScreenController.categoryList.length, (index)=> DropdownMenuItem(
                        value: index,
                        child: Container(
                          child: Padding(
                              padding: EdgeInsets.only(left: scale_width(8.0)),
                              child: Text('${editProjectScreenController.categoryList[index].name}', style: TextStyle(fontSize: scale_height(18.0))),
                            ),
                        ),
                      )),
                      icon: Container(
                          width: scale_width(23.0),
                          height: scale_height(14.0),
                          child: Icon(Icons.keyboard_arrow_down_rounded)),
                    ),
                  ),
                  
                  // Update button
                  SecondaryButton(label: 'Update', width: 62.0, function: (){  editProjectScreenController.editProject();  },),
                ],
              ),
            ),
          ),
        ),
      ),
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
              onTap: editProjectScreenController.selected,
              currentIndex: editProjectScreenController.currentIndex.value,
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
