import 'package:crypto_nas/core/params/register_params.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/core/usecase/use_case.dart';
import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';
import 'package:crypto_nas/features/feature_profile/domain/repository/profile_repository.dart';

class CallRegisterUseCase
    implements UseCase<DataState<UserEntity>, RegisterParams> {
  final ProfileRepository profileRepository;

  CallRegisterUseCase(this.profileRepository);

  @override
  Future<DataState<UserEntity>> call(RegisterParams registerParams) {
    return profileRepository.callRegisterApi(registerParams);
  }
}
