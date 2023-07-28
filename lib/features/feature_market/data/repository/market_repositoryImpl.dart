import 'package:crypto_nas/core/error_handling/app_exception.dart';
import 'package:crypto_nas/core/error_handling/check_exceptions.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/features/feature_home/data/models/AllCryptoModel.dart';
import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:crypto_nas/features/feature_market/data/data_source/remote/api_provider_market.dart';
import 'package:crypto_nas/features/feature_market/domain/repository/market_repository.dart';
import 'package:dio/dio.dart';

class MarketRepositoryImpl extends MarketRepository {
  final ApiProviderMarket _apiProviderMarket;
  MarketRepositoryImpl(this._apiProviderMarket);

  @override
  Future<DataState<TopMarketCoinEntity>> fetchAllCryptoData() async {
    try {
      final Response response = await _apiProviderMarket.getAllCryptoData();

      final TopMarketCoinEntity topMarketCapEntity =
          AllCryptoModel.fromJson(response.data);
      return DataSuccess(topMarketCapEntity);
    } on AppException catch (e) {
      return CheckExceptions.getErrorMarket(e);
    }
  }
}
