import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trko_task2/app/modules/HomeScreen/controllers/project_screen_controller_controller.dart';
import 'package:trko_task2/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';


loading(String message,){
    return Get.defaultDialog(
      title: '',
      middleText: '',
      radius: 4.0,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/trko_loading.png', height: 70.0, fit: BoxFit.fitWidth),
          Container(
                alignment: Alignment.bottomCenter,
                child: Text(message, style: TextStyle(fontSize: 18.0,))),
        ],
      ),
      barrierDismissible: false,
    );
  }

Widget loadingProjects(String message){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(MyCustomColors.blue()),
          ),
          SizedBox(height: scale_height(18.0),),
          Text('$message', style: TextStyle(fontSize: scale_height(16.0),), textAlign: TextAlign.center,),
        ],
      ),
    );
  }

Widget refreshProjectScreen(String message, String token,){
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, size: scale_height(90.0), color: MyCustomColors.blue(),),
          SizedBox(height: scale_height(8.0),),
          Text('$message', style: TextStyle(fontSize: scale_height(16.0),), textAlign: TextAlign.center,),
          SizedBox(height: scale_height(24.0),),
          RaisedButton(
              color: MyCustomColors.blue(),
              padding: EdgeInsets.symmetric(vertical: scale_height(1.4)),
              onPressed: (){
              Get.offAll(()=> HomeScreen(), arguments: token);
              },
            child: Text('Refresh', style: TextStyle(fontSize: scale_height(16.0), color: Colors.white)),
          )
        ]
      ),
    );
  }



  deleteDialog({String onConfirm_label, String onCancel_label, String project_name, Function onConfirm, Function onCancel}){
    return Get.defaultDialog(
      radius: 5.0,
      title: '\n  Do you want to permanently delete   \n $project_name project?',
      middleText: '',
      actions: [
        RaisedButton(
          color: Colors.white,
          onPressed: onConfirm,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0), side: BorderSide(color: MyCustomColors.blue(), width: scale_height(1.2))),
          child: Text(onConfirm_label, style: TextStyle(color: MyCustomColors.blue()))
          ),
        SizedBox(width: scale_width(20.0),),
        RaisedButton(
          color: MyCustomColors.blue(), 
          onPressed: onCancel,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Text(onCancel_label, style: TextStyle(color: Colors.white),)
          ),
      ],
    );
}

