part of 'profile_bloc.dart';

// ignore: must_be_immutable
class ProfileState extends Equatable {
  RegisterStatus registerStatus;
  LoginStatus loginStatus;

  ProfileState({
    required this.registerStatus,
    required this.loginStatus,
  });

  ProfileState copyWith({
    RegisterStatus? newRegisterStatus,
    LoginStatus? newLoginStatus,
  }) {
    return ProfileState(
      registerStatus: newRegisterStatus ?? registerStatus,
      loginStatus: newLoginStatus ?? loginStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        registerStatus,
        loginStatus,
      ];
}
