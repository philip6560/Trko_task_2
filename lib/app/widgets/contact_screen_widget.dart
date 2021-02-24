import 'package:flutter/material.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';

class ContactContainer extends StatelessWidget {

  Widget child;
  ContactContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: scale_width(21.0)),
      width: scale_width(349.0), height: scale_height(65.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.2),
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: child,
    );
  }
}