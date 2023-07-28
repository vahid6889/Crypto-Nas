part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  final List<String> userProfile;

  UserProfileState({
    List<String>? userProfile,
  }) : userProfile = userProfile ?? [];

  UserProfileState copyWith({
    List<String>? newUserProfile,
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
