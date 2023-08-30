import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:interviewapp/core/failur/failure.dart';
import 'package:interviewapp/features/auth/data/data_source/local/local_data_storage.dart';
import 'package:interviewapp/features/auth/data/model/request/login_request.dart';
import 'package:interviewapp/features/auth/data/model/response/login_response.dart';
import '../../domain/repository/app_repository.dart';
import '';
import '../data_source/remote/remote_data_source.dart';


class DataRepository extends DataSourceRepository{
  final repository = Get.put(RemoteDataSource());
  @override
  Future<Either<Failure,LoginResponse>>? login(LoginRequest request) async{
    final response = await repository.login(request);
    if(response!.isRight){
      LocalDtaSource.setToken(response.right.token);
      return Right(response.right);
    }else{
      return Left(response.left);
    }
  }
}