import 'package:flutter/material.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';


class ContactDisplay extends StatelessWidget {
  final String label;
  final String contact;
  final double height_1;
  final double width_1;
  final double height_2;
  final double width_2;

  ContactDisplay({@required this.label, @required this .contact, this.width_1, this.height_1, this.width_2, this.height_2}):assert(label != null && contact != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scale_width(349.0),
      height: scale_width(65.0),
      child: Column(
        children: [
          Container(
            height: scale_height(height_1),
              width: scale_width(width_1),
              child: Text(label, style: TextStyle(fontSize: scale_height(16.0),),)),
          Container(
            height: scale_height(height_2),
              width: scale_width(width_2),
              child: Text(contact, style: TextStyle(fontSize: scale_height(16.0),),)),
        ],
      ),
    );
  }
}
