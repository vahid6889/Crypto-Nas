import 'package:crypto_nas/core/error_handling/check_exceptions.dart';
import 'package:crypto_nas/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProviderHome {
  final Dio _dio = Dio();
  int limitHomeViewItem = 10;
  int limitMarketViewItem = 1000;

  /// top market cap data
  Future<Response> getTopMarketCapData() async {
    try {
      final response = await _dio.get(
          "${Constants.baseUrl}/cryptocurrency/listing?start=1&limit=$limitHomeViewItem&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap");

      return response;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }

  /// top gainer data
  Future<Response> getTopGainerData() async {
    try {
      final response = await _dio.get(
          "${Constants.baseUrl}/cryptocurrency/listing?start=1&limit=$limitHomeViewItem&sortBy=percent_change_24h&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap");

      return response;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }

  /// top losers data
  Future<Response> getTopLosersData() async {
    try {
      final response = await _dio.get(
          "${Constants.baseUrl}/cryptocurrency/listing?start=1&limit=$limitHomeViewItem&sortBy=percent_change_24h&sortType=asc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap");

      return response;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }
}
