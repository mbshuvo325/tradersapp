import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewapp/app_routes.dart';
import 'package:interviewapp/features/auth/data/data_source/local/local_data_storage.dart';
import 'package:interviewapp/features/auth/data/model/request/login_request.dart';
import '../../../../core/utils/utils.dart';
import '../../data/repository/dataRepository.dart';
import '../widgets/loading_dialog.dart';
import '../widgets/snack_bar_widget.dart';

class AuthController extends GetxController{
  final repository = Get.put(DataRepository());
  final obscureText = true.obs;

  var idController = TextEditingController();
  var passwordController = TextEditingController();

  login(LoginRequest request) async{
    Dialogs.showLoadingDialog(message: CustomString.signingIn);
    final response = await repository.login(request);
    Get.back();
    if(response!.isRight){
      GetCustomSnackBar.getSnackBar(CustomString.loginSuccessFull,color: Colors.green);
      AppRoute.routeToDashBoard();
    }else{
      GetCustomSnackBar.getSnackBar(response.left.message,color: Colors.red);
    }
  }

  getUserAuthData() async{
   final userId = await LocalDtaSource.getUserId();
   final password = await LocalDtaSource.getPassword();
    if(userId != null && password != null){
      idController.text = userId;
      passwordController.text = password;
    }
  }

  @override
  void onInit() async{
    await getUserAuthData();
    super.onInit();
  }
}