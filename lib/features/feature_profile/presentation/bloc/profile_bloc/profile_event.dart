part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class LoadRegisterEvent extends ProfileEvent {
  final RegisterParams registerParams;

  LoadRegisterEvent(this.registerParams);
}

class LoadLoginEvent extends ProfileEvent {
  final LoginParams loginParams;

  LoadLoginEvent(this.loginParams);
}
