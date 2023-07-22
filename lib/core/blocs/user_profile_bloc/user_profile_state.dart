part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  final List<String> userProfile;

  UserProfileState({
    userProfile,
  }) : userProfile = userProfile ?? [];

  UserProfileState copyWith({
    newUserProfile,
  }) {
    return UserProfileState(
      userProfile: newUserProfile ?? userProfile,
    );
  }

  @override
  List<Object?> get props => [
        userProfile,
      ];
}
