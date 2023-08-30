import 'package:either_dart/either.dart';
import 'package:interviewapp/core/failur/failure.dart';
import '../../data/model/request/login_request.dart';
import '../../data/model/response/login_response.dart';

abstract class DataSourceRepository {
  Future<Either<Failure,LoginResponse>>? login(LoginRequest request);
}