import 'package:flutter/material.dart';
import 'package:trko_task2/app/widgets/UI%20responsiveness.dart';

class SplashScreenView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: scale_height(377.0),
          width: scale_width(337.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon.png'),
                fit: BoxFit.cover,
              )
          ),
        ),
      ),
    );
  }

}
