import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../errors/failures.dart';

/// Base class for all use cases
abstract class UseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}

/// Class for all use cases with no parameters
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
