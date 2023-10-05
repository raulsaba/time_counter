import 'package:dartz/dartz.dart';

import '../../../errors/failures.dart';
import '../entities/theme_entity.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeEntity?>> getTheme();
  Future<Either<Failure, bool>> setTheme(ThemeEntity theme);
}
