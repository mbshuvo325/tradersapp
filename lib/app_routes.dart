import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:interviewapp/features/auth/presentation/pagees/login_page.dart';

import 'features/auth/presentation/pagees/dash_board.dart';

class AppRoute{
  static void routeToLogin(){
    Get.offAll(()=> const LoginPage());
  }
  static void routeToDashBoard(){
    Get.offAll(()=> DashBoardPage());
  }
}