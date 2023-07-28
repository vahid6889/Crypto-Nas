import 'package:crypto_nas/core/error_handling/app_exception.dart';
import 'package:crypto_nas/core/error_handling/check_exceptions.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/features/feature_home/data/data_source/remote/api_provider_home.dart';
import 'package:crypto_nas/features/feature_home/data/models/AllCryptoModel.dart';
import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:crypto_nas/features/feature_home/domain/repository/home_repository.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl extends HomeRepository {
  final ApiProviderHome _apiProviderHome;
  HomeRepositoryImpl(this._apiProviderHome);

  @override
  Future<DataState<TopMarketCoinEntity>> fetchTopMarketCapData() async {
    try {
      final Response response = await _apiProviderHome.getTopMarketCapData();

      final TopMarketCoinEntity topMarketCapEntity =
          AllCryptoModel.fromJson(response.data);
      return DataSuccess(topMarketCapEntity);
    } on AppException catch (e) {
      return CheckExceptions.getErrorMarket(e);
    }
  }

  @override
  Future<DataState<TopMarketCoinEntity>> fetchTopGainerData() async {
    try {
      final Response response = await _apiProviderHome.getTopGainerData();

      final TopMarketCoinEntity topMarketCapEntity =
          AllCryptoModel.fromJson(response.data);
      return DataSuccess(topMarketCapEntity);
    } on AppException catch (e) {
      return CheckExceptions.getErrorMarket(e);
    }
  }

  @override
  Future<DataState<TopMarketCoinEntity>> fetchTopLoserData() async {
    try {
      final Response response = await _apiProviderHome.getTopLosersData();

      final TopMarketCoinEntity topMarketCapEntity =
          AllCryptoModel.fromJson(response.data);
      return DataSuccess(topMarketCapEntity);
    } on AppException catch (e) {
      return CheckExceptions.getErrorMarket(e);
    }
  }
}
