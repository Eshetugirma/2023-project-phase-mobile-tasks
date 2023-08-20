import 'package:equatable/equatable.dart';

import 'exception.dart';

/// Base class for all failures
abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

/// Failure class for local exceptions
class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  factory CacheFailure.cacheNotFound() =>
      const CacheFailure(message: 'Cache not found');

  factory CacheFailure.readError() =>
      const CacheFailure(message: 'Error while parsing json');

  factory CacheFailure.fromException(CacheException exception) {
    if (exception == CacheException.cacheNotFound()) {
      return CacheFailure.cacheNotFound();
    } else if (exception == CacheException.readError()) {
      return CacheFailure.readError();
    }

    return const CacheFailure(message: 'Unknown error');
  }
}

/// Failure class for server exceptions
class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  factory ServerFailure.invalidResponse() =>
      const ServerFailure(message: 'Invalid JSON format');

  factory ServerFailure.operationFailed() =>
      const ServerFailure(message: 'Operation failed');

  factory ServerFailure.connectionFailed() =>
      const ServerFailure(message: 'Unable to connect to server');

  factory ServerFailure.fromException(ServerException exception) {
    if (exception == ServerException.invalidResponse()) {
      return ServerFailure.invalidResponse();
    } else if (exception == ServerException.operationFailed()) {
      return ServerFailure.operationFailed();
    } else if (exception == ServerException.connectionFailed()) {
      return ServerFailure.connectionFailed();
    }

    return const ServerFailure(message: 'Unknown error');
  }
}
