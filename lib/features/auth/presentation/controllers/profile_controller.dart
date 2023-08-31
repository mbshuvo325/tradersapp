
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interviewapp/features/auth/data/model/request/profile_request.dart';
import 'package:interviewapp/features/auth/data/model/response/profile_response.dart';
import 'package:interviewapp/features/auth/domain/useCase/profile_use_case.dart';
import 'package:interviewapp/features/auth/presentation/widgets/snack_bar_widget.dart';

import '../../data/data_source/local/local_data_storage.dart';
import '../../data/repository/dataRepository.dart';
import '../widgets/loading_dialog.dart';

class ProfileController extends GetxController{
  final repository = Get.put(DataRepository());
  final userData = Rxn<ProfileResponse>();

  getProfileData() async{
   final login = await LocalDtaSource.getLoginKey();
   final token = await LocalDtaSource.getToken();
   ProfileRequest request = ProfileRequest(login: int.parse(login!), token: token!);
   final result = await repository.getUserProfile(request);
   if(result!.isRight){
     userData.value = result.right;
   }else{
     GetCustomSnackBar.getSnackBar("Failed to load data!",color: Colors.red);
   }
  }

  @override
  void onInit() async{
    await getProfileData();
    super.onInit();
  }
}