import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';

abstract class MarketRepository {
  Future<DataState<TopMarketCoinEntity>> fetchAllCryptoData();
}
