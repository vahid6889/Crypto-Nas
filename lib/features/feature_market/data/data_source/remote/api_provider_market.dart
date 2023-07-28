import 'package:crypto_nas/core/error_handling/check_exceptions.dart';
import 'package:crypto_nas/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProviderMarket {
  final Dio _dio = Dio();
  int limitHomeViewItem = 10;
  int limitMarketViewItem = 1000;

  /// all crypto data
  Future<Response> getAllCryptoData() async {
    try {
      final response = await _dio.get(
          "${Constants.baseUrl}/cryptocurrency/listing?start=1&limit=$limitMarketViewItem&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap");

      return response;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }
}
