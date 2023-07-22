part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ThemeSetInitialEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}

class ThemeSwitchEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}
