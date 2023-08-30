
import 'package:either_dart/src/either.dart';
import 'package:get/get.dart';
import 'package:interviewapp/core/failur/failure.dart';
import 'package:interviewapp/features/auth/data/model/request/login_request.dart';
import 'package:interviewapp/features/auth/data/model/response/login_response.dart';

import '../../../../core/baseUseCase/base_use_case.dart';
import '../../data/repository/dataRepository.dart';

class LoginUseCase implements BaseUseCase<LoginResponse,LoginRequest>{
  final repository = Get.put(DataRepository());
  @override
  Future<Either<Failure, LoginResponse>> call(LoginRequest params) async{
    final response = await repository.login(params);
    if(response!.isRight){
      return Right(response.right);
    }else{
      return Left(response.left);
    }
  }
}