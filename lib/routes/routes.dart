import 'package:get/get.dart';
import 'package:user_app_task/routes/routes_names.dart';
import 'package:user_app_task/view/home_screen.dart';
import 'package:user_app_task/view/login_screen.dart';
import 'package:user_app_task/view/register_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesNames.registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesNames.homeScreen,
      page: () => HomeScreen(),
    ),
  ];
}
