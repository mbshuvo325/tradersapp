
import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:interviewapp/features/auth/data/model/request/profile_request.dart';
import 'package:interviewapp/features/auth/data/model/response/profile_response.dart';
import 'package:interviewapp/features/auth/domain/useCase/profile_use_case.dart';

import '../../data/data_source/local/local_data_storage.dart';

class ProfileController extends GetxController{
  final useCase = Get.put(ProfileUseCase());
  final userData = Rxn<ProfileResponse>();

  getProfileData() async{
   final login = await LocalDtaSource.getLoginKey();
   final token = await LocalDtaSource.getToken();
   ProfileRequest request = ProfileRequest(login: int.parse(login!), token: token!);
   final result = await useCase(request);
   if(result.isRight){
     userData.value = result.right;
   }else{

   }
  }
}