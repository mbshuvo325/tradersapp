
import 'package:get/get.dart';
import 'package:interviewapp/app_routes.dart';
import 'package:interviewapp/features/auth/data/model/request/login_request.dart';

import '../../domain/useCase/login_use_case.dart';

class AuthController extends GetxController{
  final useCase = Get.put(LoginUseCase());

  login(LoginRequest request) async{
    final response = await useCase(request);
    print("IS RIGHT 1: ${response!.isRight}");
    if(response.isRight){
      AppRoute.routeToDashBoard();
    }else{
      print(response.left);
    }
  }
}