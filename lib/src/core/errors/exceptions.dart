abstract class AppExceptions implements Exception {
  final String message;
  final StackTrace? stackTrace;

  AppExceptions({required this.message, this.stackTrace});
}

class JsonException extends AppExceptions {
  JsonException({required super.message, super.stackTrace});
}

class CacheException extends AppExceptions {
  CacheException({required super.message, super.stackTrace});
}

class TimeException extends AppExceptions {
  TimeException({required super.message, super.stackTrace});
}

class DataTimeException extends AppExceptions {
  DataTimeException({required super.message, super.stackTrace});
}
