import 'package:crypto_nas/core/params/login_params.dart';
import 'package:crypto_nas/core/params/register_params.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<DataState<UserEntity>> callRegisterApi(RegisterParams registerParams);
  Future<DataState<UserEntity>> callLoginApi(LoginParams loginParams);
}
