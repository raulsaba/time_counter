class Failure {
  final String message;

  Failure({required this.message});
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure({super.message = "Algo inesperado aconteceu!"});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class JsonFailure extends Failure {
  JsonFailure({required super.message});
}

class TimeFailure extends Failure {
  TimeFailure({required super.message});
}

class DataTimeFailure extends Failure {
  DataTimeFailure({required super.message});
}
