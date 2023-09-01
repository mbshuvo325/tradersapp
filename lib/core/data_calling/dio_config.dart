import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:interviewapp/core/failur/failure.dart';

class DioClientSetup{

  static const loginUrl = "https://peanut.ifxdb.com/api/ClientCabinetBasic/IsAccountCredentialsCorrect";
  static const getProfileUrl = "https://peanut.ifxdb.com/api/ClientCabinetBasic/GetAccountInformation";
  static const getLastFourDigitOfPhoneNumber = "https://peanut.ifxdb.com/api/ClientCabinetBasic/GetLastFourNumbersPhone";
  static const openTrade = "https://peanut.ifxdb.com/api/ClientCabinetBasic/GetOpenTrades";

  static Future<Either<Failure,Response>> postRequest(String url, Map<String, dynamic> data) async {
    final dio = Dio();
    try {
      Response response = await dio.post(url, data: data);
      return Right(response);
    } catch (e) {
      if(url == loginUrl){
        return Left(Failure("Invalid Credentials"));
      }else{
        return Left(Failure("Session Expired"));
      }
    }
  }

  static void getRequest(String url) async {
    final dio = Dio();
    try {
      Response response = await dio.get(url);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}