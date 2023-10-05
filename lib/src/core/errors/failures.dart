class Failure {
  final String message;

  Failure({required this.message});
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({String message = "Algo inesperado aconteceu!"}) : super(message: message);
}

class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);
}

class JsonFailure extends Failure {
  JsonFailure({required String message}) : super(message: message);
}

class TimeFailure extends Failure {
  TimeFailure({required String message}) : super(message: message);
}

class DataTimeFailure extends Failure {
  DataTimeFailure({required String message}) : super(message: message);
}
