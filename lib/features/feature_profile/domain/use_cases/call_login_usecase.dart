import 'package:crypto_nas/core/params/login_params.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/core/usecase/use_case.dart';
import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';
import 'package:crypto_nas/features/feature_profile/domain/repository/profile_repository.dart';

class CallLoginUseCase implements UseCase<DataState<UserEntity>, LoginParams> {
  final ProfileRepository profileRepository;

  CallLoginUseCase(this.profileRepository);

  @override
  Future<DataState<UserEntity>> call(LoginParams loginParams) {
    return profileRepository.callLoginApi(loginParams);
  }
}
