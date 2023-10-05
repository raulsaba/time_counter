import 'package:dartz/dartz.dart';
import 'package:time_counter/src/core/errors/failures.dart';
import 'package:time_counter/src/core/theme/domain/entities/theme_entity.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeEntity?>> getTheme();
  Future<Either<Failure, bool>> setTheme(ThemeEntity theme);
}
