import 'package:crypto_nas/core/error_handling/app_exception.dart';
import 'package:crypto_nas/core/error_handling/check_exceptions.dart';
import 'package:crypto_nas/core/params/login_params.dart';
import 'package:crypto_nas/core/params/register_params.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/features/feature_profile/data/data_source/remote/api_provider_profile.dart';
import 'package:crypto_nas/features/feature_profile/data/models/user_model.dart';
import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';
import 'package:crypto_nas/features/feature_profile/domain/repository/profile_repository.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ApiProviderProfile _apiProviderProfile;
  ProfileRepositoryImpl(this._apiProviderProfile);

  @override
  Future<DataState<UserEntity>> callRegisterApi(
    RegisterParams registerParams,
  ) async {
    try {
      final Response response =
          await _apiProviderProfile.callRegisterApi(registerParams);

      final UserEntity profileEntity = UserModel.fromJson(response.data);

      return DataSuccess(profileEntity);
    } on AppException catch (e) {
      return CheckExceptions.getErrorProfile(e);
    }
  }

  @override
  Future<DataState<UserEntity>> callLoginApi(LoginParams loginParams) async {
    try {
      final Response response =
          await _apiProviderProfile.callLoginApi(loginParams);

      final UserEntity profileEntity = UserModel.fromJson(response.data);

      return DataSuccess(profileEntity);
    } on AppException catch (e) {
      return CheckExceptions.getErrorProfile(e);
    }
  }
}
