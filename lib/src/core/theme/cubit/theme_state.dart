part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {
  final ThemeEntity theme;

  const ThemeState({
    required this.theme,
  });
}

final class ThemeError extends ThemeState {
  final String message;
  const ThemeError({
    required this.message,
    super.theme = const ThemeEntity(
      brightness: Brightness.light,
      primaryColor: Colors.deepPurple,
    ),
  });
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial({
    super.theme = const ThemeEntity(
      brightness: Brightness.light,
      primaryColor: Colors.deepPurple,
    ),
  });
}

final class ThemeCustom extends ThemeState {
  const ThemeCustom({
    required ThemeEntity theme,
  }) : super(
          theme: theme,
        );
}
