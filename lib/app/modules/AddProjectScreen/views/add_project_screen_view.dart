import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trko_task2/app/widgets/button_widgets.dart';
import 'package:trko_task2/app/widgets/textformfield_widgets.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';
import '../controllers/add_project_screen_controller.dart';

class AddProjectScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    AddProjectScreenController addProjectScreenController = Get.put(AddProjectScreenController());
    addProjectScreenController.token.value = Get.arguments['token'];
    addProjectScreenController.categoryList = Get.arguments['categories'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Container(
          margin: EdgeInsets.only(left: scale_width(31.0), top: scale_height(23.0), bottom: scale_height(18.0)),
          width: scale_width(103.0),
          height: scale_height(20.0),
            child: Text('Add Project', style: TextStyle(fontSize: 20.0, color: Colors.white),),),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Obx(()=> Form(
              key: addProjectScreenController.formKey.value,
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
                      controller: addProjectScreenController.titlecontroller,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      focusNode: addProjectScreenController.title_focus_node.value,
                      validator: (val)=> val.isNotEmpty? null: 'Enter a title please',
                      onSaved: (val){   addProjectScreenController.title.value = val;  },
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
                      focusNode: addProjectScreenController.description_focus_node.value,
                      controller: addProjectScreenController.descriptioncontroller,
                      maxLines: 60,
                      textInputAction: TextInputAction.newline,
                      validator: (val)=> val.isNotEmpty? null: 'Enter a description please',
                      onSaved: (val){   addProjectScreenController.description.value = val;  },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),

                  // Category dropdown menu label
                  Container(
                    margin: EdgeInsets.only(left: scale_width(32.0), bottom: scale_height(13.0), right: scale_width(233.0)),
                    width: scale_width(147.0),
                    height: scale_height(20.0),
                    child: TextFormFieldLabel(label: 'Project Category',),
                  ),

                  // category dropdown menu
                  Container(
                    margin: EdgeInsets.only(bottom: scale_height(32.0)), 
                    height: scale_height(52.0),
                    width: scale_width(349.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,),
                    ),
                    child: DropdownButton(
                      onTap: (){  
                          addProjectScreenController.title_focus_node.value.unfocus(); 
                          addProjectScreenController.description_focus_node.value.unfocus();  
                       },
                      underline: Container(),
                      hint: Container(
                        margin: EdgeInsets.only(left: scale_width(10.0) ),
                        height: scale_height(18.0),
                        width: scale_width(126.0),
                          child: Text('Select Category', style: TextStyle(fontSize: scale_height(18.0)),)),
                      isExpanded: true,
                      onChanged: addProjectScreenController.currentItem,
                      value: addProjectScreenController.selected_category.value,
                      items: List.generate(addProjectScreenController.categoryList.length, (index)=> DropdownMenuItem(
                        value: index,
                        child: Padding(
                          padding: EdgeInsets.only(left: scale_width(8.0)),
                          child: Text('${addProjectScreenController.categoryList[index].name}', style: TextStyle(fontSize: scale_height(18.0))),
                        ),
                      )),
                      icon: Container(
                        width: scale_width(23.0),
                          height: scale_height(14.0),
                          child: Icon(Icons.keyboard_arrow_down_rounded)),
                    ),
                  ),

                  // Add project button
                  Padding(
                    padding: EdgeInsets.only(bottom: scale_height(90.0)),
                    child: SecondaryButton(label: 'Add Project', width: 103.0, function:() {addProjectScreenController.addProject();},),
                  ),
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
              onTap: addProjectScreenController.selected,
              currentIndex: addProjectScreenController.currentIndex.value,
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
