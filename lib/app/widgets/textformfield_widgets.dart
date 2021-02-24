import 'package:flutter/material.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';


class PrimaryTextFormField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scale_width(91.505),
      margin: EdgeInsets.only(bottom: scale_height(8.477)),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: scale_height(2.089),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldLabel extends StatelessWidget {
  
  final String label;
  
  TextFormFieldLabel({this.label}):assert(label != null);
  
  @override
  Widget build(BuildContext context) {
    return Text('$label', style: TextStyle(fontSize: scale_height(20.0)),);
  }
}

