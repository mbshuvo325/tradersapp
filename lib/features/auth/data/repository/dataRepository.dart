import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:either_dart/either.dart';
import 'package:get/get.dart';
import 'package:interviewapp/app_routes.dart';
import 'package:interviewapp/core/failur/failure.dart';
import 'package:interviewapp/features/auth/data/data_source/local/local_data_storage.dart';
import 'package:interviewapp/features/auth/data/model/request/login_request.dart';
import 'package:interviewapp/features/auth/data/model/request/profile_request.dart';
import 'package:interviewapp/features/auth/data/model/response/login_response.dart';
import 'package:interviewapp/features/auth/data/model/response/open_trade_response.dart';
import 'package:interviewapp/features/auth/data/model/response/profile_response.dart';
import '../../domain/repository/app_repository.dart';
import '';
import '../data_source/remote/remote_data_source.dart';


class DataRepository extends DataSourceRepository{
  final repository = Get.put(RemoteDataSource());
  @override
  Future<Either<Failure,LoginResponse>>? login(LoginRequest request) async{
    bool result = await DataConnectionChecker().hasConnection;
    if(!result){
      return Left(Failure("No Internet Connection"));
    }
    final response = await repository.login(request);
    if(response!.isRight){
      LocalDtaSource.setLoginKey(request.login.toString());
      LocalDtaSource.setToken(response.right.token);
      return Right(response.right);
    }else{
      return Left(response.left);
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>>? getUserProfile(ProfileRequest request) async{
    bool result = await DataConnectionChecker().hasConnection;
    if(!result){
     final result = await LocalDtaSource.getUserProfile();
      return Right(result!);
    }
    final response = await repository.getUserProfile(request);
    if(response!.isRight){
      LocalDtaSource.setProfile(response.right);
      return Right(response.right);
    }else{
      LocalDtaSource.clearBox();
      AppRoute.routeToLogin();
      return Left(response.left);
    }
  }

  @override
  Future<Either<Failure, String>>? getPhoneLastFourDigit(ProfileRequest request) async{
    bool result = await DataConnectionChecker().hasConnection;
    if(!result){
      final result = await LocalDtaSource.getPhoneLastFourDigit();
      return Right(result!);
    }
    final response = await repository.getPhoneLastFourDigit(request);
    if(response!.isRight){
      LocalDtaSource.setPhoneLastFourDigit(response.right);
      return Right(response.right);
    }else{
      LocalDtaSource.clearBox();
      AppRoute.routeToLogin();
      return Left(response.left);
    }
  }

  @override
  Future<Either<Failure,List<GetOpenTradesResponse>>>? getAllOpenTrades(ProfileRequest request) async{
    bool result = await DataConnectionChecker().hasConnection;
    if(!result){
      return Left(Failure("No Internet Connection"));
    }
    final response = await repository.getAllOpenTrades(request);
    if(response!.isRight){
      return Right(response.right);
    }else{
      LocalDtaSource.clearBox();
      AppRoute.routeToLogin();
      return Left(response.left);
    }
  }
}