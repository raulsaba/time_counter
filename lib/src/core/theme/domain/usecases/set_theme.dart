import 'package:dartz/dartz.dart';

import '../../../errors/failures.dart';
import '../entities/theme_entity.dart';
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
