import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';

abstract class HomeRepository {
  Future<DataState<TopMarketCoinEntity>> fetchTopMarketCapData();
  Future<DataState<TopMarketCoinEntity>> fetchTopGainerData();
  Future<DataState<TopMarketCoinEntity>> fetchTopLoserData();
}
