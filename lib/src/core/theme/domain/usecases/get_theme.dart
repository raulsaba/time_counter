import 'package:dartz/dartz.dart';

import '../../../errors/failures.dart';
import '../entities/theme_entity.dart';
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
