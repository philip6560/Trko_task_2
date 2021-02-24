import 'package:flutter/material.dart';
import 'package:trko_task2/app/widgets/contact_screen_widget.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: scale_width(69.0), height: scale_height(16.0),
          child: Text('Contact', style: TextStyle(color: Colors.white),)),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(height: scale_height(35.0),),
            
            // Container one
            ContactContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: scale_height(13.0), bottom: scale_height(7.0), left: scale_width(1.0)),
                    width: scale_width(73.0), height: scale_height(16.0),
                    child: Text('WhatsApp', style: TextStyle(fontSize: scale_height(16.0),color: Colors.grey),),
                ),
                  Container(
                    width: scale_width(126.0), height: scale_height(13.0),
                    child: Text('+2347015152515',style: TextStyle(fontSize: scale_height(16.0),color: Colors.grey),),
                  ),
                ],
              ),
            ),

            SizedBox(height: scale_height(24.0),),

            // Container two
            ContactContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: scale_height(13.0), bottom: scale_height(10.0)),
                    width: scale_width(38.0), height: scale_height(13.0),
                    child: Text('Email',style: TextStyle(fontSize: scale_height(16.0), color: Colors.grey),),
                  ),
                  Container(
                    width: scale_width(244.0), height: scale_height(16.0),
                    child: Text('support@specialmansolution.com',style: TextStyle(fontSize: scale_height(16.0),color: Colors.grey),),
                  ),
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}
