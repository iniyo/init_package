import 'package:flutter/foundation.dart';

sealed class Failure {
  const Failure();
}

class NetworkFailure extends Failure {
  final String message;
  const NetworkFailure(this.message);
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;
  const CacheFailure(this.message);
}

void handleError(Failure failure) {
  switch (failure) {
    case NetworkFailure _:
      if (kDebugMode) {
        print('Network error occurred: ${(failure).message}');
      }
      break;
    case ServerFailure _:
      if (kDebugMode) {
        print('Server error occurred: ${(failure).message}');
      }
      break;
    case CacheFailure _:
      if (kDebugMode) {
        print('Cache error occurred: ${(failure).message}');
      }
      break;
  }
}
