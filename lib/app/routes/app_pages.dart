import 'package:get/get.dart';

import 'package:trko_task2/app/modules/AddProjectScreen/bindings/add_project_screen_binding.dart';
import 'package:trko_task2/app/modules/AddProjectScreen/views/add_project_screen_view.dart';
import 'package:trko_task2/app/modules/ContactScreen/bindings/contact_screen_binding.dart';
import 'package:trko_task2/app/modules/ContactScreen/views/contact_screen_view.dart';
import 'package:trko_task2/app/modules/EditProjectScreen/bindings/edit_project_screen_binding.dart';
import 'package:trko_task2/app/modules/EditProjectScreen/views/edit_project_screen_view.dart';
import 'package:trko_task2/app/modules/LoginScreen/bindings/login_screen_binding.dart';
import 'package:trko_task2/app/modules/LoginScreen/views/login_screen_view.dart';
import 'package:trko_task2/app/modules/RegisterScreen/bindings/register_screen_binding.dart';
import 'package:trko_task2/app/modules/RegisterScreen/views/register_screen_view.dart';
import 'package:trko_task2/app/modules/SplashScreen/bindings/splash_screen_binding.dart';
import 'package:trko_task2/app/modules/SplashScreen/views/splash_screen_view.dart';
import 'package:trko_task2/app/modules/HomeScreen/bindings/home_screen_binding.dart';
import 'package:trko_task2/app/modules/HomeScreen/views/home_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_SCREEN,
      page: () => ContactScreen(),
      binding: ContactScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => RegisterScreen(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROJECT_SCREEN,
      page: () => AddProjectScreen(),
      binding: AddProjectScreenBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROJECT_SCREEN,
      page: () => EditProjectScreen(),
      binding: EditProjectScreenBinding(),
    ),
  ];
}
