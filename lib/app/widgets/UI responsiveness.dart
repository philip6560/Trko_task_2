import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

double scale_width(value){

  // width of the screen the design was made on
  const double width = 412.0;

  double width_of_device = Get.mediaQuery.size.width.floorToDouble();
  double safe_area_horizontal = Get.mediaQuery.padding.left.floorToDouble() + Get.mediaQuery.padding.right.floorToDouble();
  // convert_value from the dimensions stated in the design to %percentage
  double converted_value = (value/width) * 100;
  // the converted_value is then utilized to give the percentage based on different screen width
  double actual_width_based_on_screensize = (converted_value/100) * (width_of_device - safe_area_horizontal);
  double mod = pow(10.0, 2);
  double final_width = ((actual_width_based_on_screensize * mod).round().toDouble() / mod);
  return final_width;
}

double scale_height(value){

  // height of the screen the design was made on
  const double height = 814;

  double height_of_device = Get.mediaQuery.size.height.floorToDouble();
  double safe_area_vertical =  Get.mediaQuery.padding.top.floorToDouble() + Get.mediaQuery.padding.bottom.floorToDouble() + AppBar().preferredSize.height.floorToDouble();
  // convert_value from the dimensions stated in the design to %percentage
  double converted_height = (value/height) * 100;
  // the converted_value is then utilized to give the percentage based on different screen height
  double actual_height_based_on_screensize = (converted_height/100) * (height_of_device - safe_area_vertical);
  double mod = pow(10.0, 2);
  double final_height = ((actual_height_based_on_screensize * mod).round().toDouble() / mod);
  return final_height;
}

class MyCustomColors{

  MyCustomColors._();

  static const _blue = '#44D9E6';
  static const _deepblue = '#003281';
  static const _lightblue = '#F2FEFF';
  

  // construct a color from a hex code string of the form #RRGGBB
  static _hexToColor(String code){
    code = code.substring(1, 7);
    int val = code.length == 6 ? int.parse(code, radix: 16): int.parse(code) ;
    val = val + 0xff000000;
    return val;
  }

//  returns int Color code which is to be passed in Color()
  static blue() => Color(_hexToColor(_blue)); 
  static deepblue() => Color(_hexToColor(_deepblue));
  static lightblue() => Color(_hexToColor(_lightblue));

}