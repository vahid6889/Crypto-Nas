import 'package:bloc/bloc.dart';
import 'package:crypto_nas/core/utils/prefs_operator.dart';
import 'package:crypto_nas/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

PrefsOperator prefsOperator = locator();

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileState()) {
    on<UserProfileInitialEvent>(onUserProfileInitial);
    on<UserProfileLoadingEvent>(onUserProfileLoading);
  }

  onUserProfileInitial(
      UserProfileInitialEvent event, Emitter<UserProfileState> emit) async {
    final List<String> getUserProfile = [];
    emit(state.copyWith(newUserProfile: getUserProfile));
  }

  onUserProfileLoading(
      UserProfileLoadingEvent event, Emitter<UserProfileState> emit) async {
    final getUserProfile = await prefsOperator.getUserProfile();

    emit(
      state.copyWith(
        newUserProfile: getUserProfile,
      ),
    );
  }
}
