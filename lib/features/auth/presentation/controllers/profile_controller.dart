
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewapp/features/auth/data/model/request/profile_request.dart';
import 'package:interviewapp/features/auth/data/model/response/open_trade_response.dart';
import 'package:interviewapp/features/auth/data/model/response/profile_response.dart';
import 'package:interviewapp/features/auth/presentation/widgets/snack_bar_widget.dart';
import '../../data/data_source/local/local_data_storage.dart';
import '../../data/repository/dataRepository.dart';

class ProfileController extends GetxController{
  final repository = Get.put(DataRepository());
  final userData = Rxn<ProfileResponse>();
  final openTrades = <GetOpenTradesResponse>[].obs;
  final userPhone = RxnString();
  final tradeLoading = false.obs;
  final totalProfit = 0.0.obs;

  getProfileData() async{
   final login = await LocalDtaSource.getLoginKey();
   final token = await LocalDtaSource.getToken();
   ProfileRequest request = ProfileRequest(login: int.parse(login!), token: token!);
   final result = await repository.getUserProfile(request);
   if(result!.isRight){
     userData.value = result.right;
     final phone = await repository.getPhoneLastFourDigit(request);
      if(phone!.isRight) {
        userPhone.value = phone.right;
      }
   }else{
     GetCustomSnackBar.getSnackBar("Session Expire",color: Colors.red);
   }
  }

  getCurrentOpenTrades() async{
    tradeLoading.value = true;
    final login = await LocalDtaSource.getLoginKey();
    final token = await LocalDtaSource.getToken();
    ProfileRequest request = ProfileRequest(login: int.parse(login!), token: token!);
    final result = await repository.getAllOpenTrades(request);
    tradeLoading.value = false;
    if(result!.isRight){
      openTrades.assignAll(result.right);
    }else{
      GetCustomSnackBar.getSnackBar(result.left.message,color: Colors.red);
    }
  }

  calculateTotalProfit(){
    double total = 0.0;
    openTrades.forEach((element) {
      total = total + element.profit!;
    });
    totalProfit.value = total;
  }

  @override
  void onInit() async{
    await getProfileData();
    await getCurrentOpenTrades();
    await calculateTotalProfit();
    super.onInit();
  }
}