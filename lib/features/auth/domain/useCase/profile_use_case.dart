
import 'package:either_dart/src/either.dart';
import 'package:get/get.dart';
import 'package:interviewapp/core/failur/failure.dart';
import 'package:interviewapp/features/auth/data/model/request/login_request.dart';
import 'package:interviewapp/features/auth/data/model/request/profile_request.dart';
import 'package:interviewapp/features/auth/data/model/response/login_response.dart';
import 'package:interviewapp/features/auth/data/model/response/profile_response.dart';

import '../../../../core/baseUseCase/base_use_case.dart';
import '../../data/repository/dataRepository.dart';

class ProfileUseCase implements BaseUseCase<ProfileResponse,ProfileRequest>{
  final repository = Get.put(DataRepository());
  @override
  Future<Either<Failure, ProfileResponse>> call(ProfileRequest params) async{
    final response = await repository.getUserProfile(params);
    if(response!.isRight){
      return Right(response.right);
    }else{
      return Left(response.left);
    }
  }
}