import 'package:get/get.dart';

class User{
  String email;
  String password;

  User({this.email, this.password});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'email': email,
      'password': password,
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map){
    email = map['email'];
    password = map['password'];
  }
}