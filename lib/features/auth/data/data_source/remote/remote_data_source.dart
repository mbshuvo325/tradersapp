import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:interviewapp/features/auth/data/model/request/login_request.dart';
import 'package:interviewapp/features/auth/data/model/request/profile_request.dart';
import 'package:interviewapp/features/auth/data/model/response/login_response.dart';
import 'package:interviewapp/features/auth/data/model/response/open_trade_response.dart';
import 'package:interviewapp/features/auth/data/model/response/profile_response.dart';
import 'package:interviewapp/features/auth/domain/repository/app_repository.dart';
import '../../../../../core/data_calling/dio_config.dart';
import '../../../../../core/failur/failure.dart';

class RemoteDataSource implements DataSourceRepository{
  @override
  Future<Either<Failure,LoginResponse>>? login(LoginRequest request) async{
    try {
      final response = await DioClientSetup.postRequest(DioClientSetup.loginUrl, request.toMap());
      if(response.isRight){
        final result = LoginResponse.fromMap(response.right.data);
        return Right(result);
      }else{
        return Left(Failure(response.left.message));
      }
    } catch (e) {
      return Left(Failure("Something went wrong"));
    }
  }

  @override
  Future<Either<Failure, ProfileResponse>>? getUserProfile(ProfileRequest request) async{
    try {
      final response = await DioClientSetup.postRequest(DioClientSetup.getProfileUrl, request.toMap());
      if(response.isRight){
        final result = ProfileResponse.fromMap(response.right.data);
        return Right(result);
      }else{
        return Left(Failure("Session Expired"));
      }
    } catch (e) {
      return Left(Failure("Session Expired"));
    }
  }

  @override
  Future<Either<Failure,String>>? getPhoneLastFourDigit(ProfileRequest request) async{
    try {
      final response = await DioClientSetup.postRequest(DioClientSetup.getLastFourDigitOfPhoneNumber, request.toMap());
      if(response.isRight){
        return Right(response.right.data);
      }else{
        return Left(Failure("Session Expired"));
      }
    } catch (e) {
      return Left(Failure("Session Expired"));
    }
  }

  @override
  Future<Either<Failure,List<GetOpenTradesResponse>>>? getAllOpenTrades(ProfileRequest request) async{
    try {
      final response = await DioClientSetup.postRequest(DioClientSetup.openTrade, request.toMap());
      if(response.isRight){
        List<GetOpenTradesResponse> parsedData = [];
        List<dynamic> data = response.right.data;
        data.forEach((element) {
          final trade = GetOpenTradesResponse.fromMap(element);
          parsedData.add(trade);
        });
        return Right(parsedData);
      }else{
        return Left(Failure("Session Expired"));
      }
    } catch (e) {
      return Left(Failure("Session Expired"));
    }
  }
}