import 'package:dartz/dartz.dart';
import 'package:time_counter/src/core/errors/failures.dart';
import 'package:time_counter/src/core/theme/domain/entities/theme_entity.dart';

import '../repositories/theme_repository.dart';

abstract class SetTheme {
  Future<Either<Failure, bool>> call(ThemeEntity theme);
}

class SetThemeImpl implements SetTheme {
  final ThemeRepository _repository;

  SetThemeImpl(this._repository);

  @override
  Future<Either<Failure, bool>> call(ThemeEntity theme) async {
    return await _repository.setTheme(theme);
  }
}
