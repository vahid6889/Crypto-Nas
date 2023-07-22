part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent extends Equatable {
  // const UserProfileEvent();

  // @override
  // List<Object> get props => [];
}

class UserProfileInitialEvent extends UserProfileEvent {
  @override
  List<Object?> get props => [];
}

class UserProfileLoadingEvent extends UserProfileEvent {
  @override
  List<Object?> get props => [];
}
