import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../errors/exceptions.dart';
import '../../../errors/failures.dart';
import '../../domain/entities/theme_entity.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_datasource.dart';
import '../model/theme_model.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource _localDataSource;

  ThemeRepositoryImpl(this._localDataSource);
  @override
  Future<Either<Failure, ThemeEntity?>> getTheme() async {
    try {
      final result = await _localDataSource.getTheme();
      if (result != null) {
        return Future.value(Right(result));
      } else {
        return Future.value(const Right(null));
      }
    } on JsonException catch (e) {
      return Future.value(Left(JsonFailure(message: e.message)));
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(message: e.message)));
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Future.value(Left(UnexpectedFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> setTheme(ThemeEntity theme) async {
    try {
      final result =
          await _localDataSource.setTheme(ThemeModel.fromEntity(theme));
      return Future.value(Right(result));
    } on JsonException catch (e) {
      return Future.value(Left(JsonFailure(message: e.message)));
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(message: e.message)));
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Future.value(Left(UnexpectedFailure()));
    }
  }
}
