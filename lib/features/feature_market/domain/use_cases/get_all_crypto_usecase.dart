import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/core/usecase/use_case.dart';
import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:crypto_nas/features/feature_market/domain/repository/market_repository.dart';

class GetAllCryptoUseCase
    implements UseCase<DataState<TopMarketCoinEntity>, NoParams> {
  final MarketRepository marketRepository;

  GetAllCryptoUseCase(this.marketRepository);

  @override
  Future<DataState<TopMarketCoinEntity>> call(NoParams noParams) {
    return marketRepository.fetchAllCryptoData();
  }
}
