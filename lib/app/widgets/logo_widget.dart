import 'package:flutter/material.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';


class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: scale_height(97.0)),
        height: scale_height(225.0),
        width: scale_width(226.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon.png'),
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}
