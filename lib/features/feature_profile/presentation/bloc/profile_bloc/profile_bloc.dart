import 'package:bloc/bloc.dart';
import 'package:crypto_nas/core/params/login_params.dart';
import 'package:crypto_nas/core/params/register_params.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';
import 'package:crypto_nas/features/feature_profile/domain/use_cases/call_login_usecase.dart';
import 'package:crypto_nas/features/feature_profile/domain/use_cases/call_register_usecase.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/profile_bloc/login_status.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/profile_bloc/register_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CallRegisterUseCase _callRegisterUseCase;
  final CallLoginUseCase _callLoginUseCase;
  ProfileBloc(
    this._callRegisterUseCase,
    this._callLoginUseCase,
  ) : super(
          ProfileState(
            registerStatus: RegisterInitial(),
            loginStatus: LoginInitial(),
          ),
        ) {
    on<LoadRegisterEvent>(
      (event, emit) async {
        emit(state.copyWith(newRegisterStatus: RegisterLoading()));

        final DataState<UserEntity> dataState =
            await _callRegisterUseCase(event.registerParams);

        if (dataState is DataSuccess) {
          emit(
            state.copyWith(
              newRegisterStatus: RegisterCompleted(dataState.data),
            ),
          );
        }

        if (dataState is DataFailed) {
          emit(
            state.copyWith(
              newRegisterStatus: RegisterError(dataState.error!),
            ),
          );
        }
      },
    );

    on<LoadLoginEvent>(
      (event, emit) async {
        emit(state.copyWith(newLoginStatus: LoginLoading()));

        final DataState<UserEntity> dataState =
            await _callLoginUseCase(event.loginParams);

        if (dataState is DataSuccess) {
          emit(
            state.copyWith(
              newLoginStatus: LoginCompleted(dataState.data),
            ),
          );
        }

        if (dataState is DataFailed) {
          emit(state.copyWith(newLoginStatus: LoginError(dataState.error!)));
        }
      },
    );
  }
}
