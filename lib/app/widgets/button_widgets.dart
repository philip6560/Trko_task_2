import 'package:flutter/material.dart';

import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';

class PrimaryButton extends StatelessWidget {
  final Function function;
  final String label;
  final double width;

  PrimaryButton({@required this.label, this.width, this.function}):assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scale_height(52.0),
      width: scale_width(337.0),
      decoration: BoxDecoration(
        color: MyCustomColors.blue(),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: FlatButton(
          onPressed: function,
        child: Container(
          width: scale_width(width),
          height: scale_height(20.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text('$label', style: TextStyle(color: Colors.white, fontSize: scale_height(20.0)),)
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final Function function;
  final String label;
  final double width;

  SecondaryButton({@required this.label, this.width, this.function}):assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: scale_height(52.0),
      width: scale_width(349.0),
      decoration: BoxDecoration(
        color: MyCustomColors.blue(),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: FlatButton(
        onPressed: this.function,
        child: Container(
          width: scale_width(width),
          height: scale_height(20.0),
          child: Align(
              alignment: Alignment.center,
              child: Text(label, style: TextStyle(color: Colors.white, fontSize: scale_height(20.0)),)
          ),
        ),
      ),
    );
  }
}

class LinkButton extends StatelessWidget {

  final String label;
  final double width;

  LinkButton({this.label, this.width,}):assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scale_width(width),
      height: scale_height(20.0),
      child: Text(label, style: TextStyle(color: MyCustomColors.blue(), fontSize: scale_height(20.0)),),
    );
  }
}



