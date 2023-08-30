
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import '../failur/failure.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>>? call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}