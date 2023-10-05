import 'package:dartz/dartz.dart';
import 'package:time_counter/src/core/errors/failures.dart';
import 'package:time_counter/src/core/theme/domain/entities/theme_entity.dart';

import '../repositories/theme_repository.dart';

abstract class GetTheme {
  Future<Either<Failure, ThemeEntity?>> call();
}

class GetThemeImpl implements GetTheme {
  final ThemeRepository _repository;

  GetThemeImpl(this._repository);

  @override
  Future<Either<Failure, ThemeEntity?>> call() async {
    return await _repository.getTheme();
  }
}
