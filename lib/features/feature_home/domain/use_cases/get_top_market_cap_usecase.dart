import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/core/usecase/use_case.dart';
import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:crypto_nas/features/feature_home/domain/repository/home_repository.dart';

class GetTopMarketCapUseCase
    implements UseCase<DataState<TopMarketCoinEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetTopMarketCapUseCase(this.homeRepository);

  @override
  Future<DataState<TopMarketCoinEntity>> call(NoParams noParams) {
    return homeRepository.fetchTopMarketCapData();
  }
}
