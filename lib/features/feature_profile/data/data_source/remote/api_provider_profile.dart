import 'package:crypto_nas/core/error_handling/check_exceptions.dart';
import 'package:crypto_nas/core/params/login_params.dart';
import 'package:crypto_nas/core/params/register_params.dart';
import 'package:crypto_nas/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProviderProfile {
  final Dio _dio = Dio();

  Future<dynamic> callRegisterApi(RegisterParams registerParams) async {
    try {
      var fromData = FormData.fromMap({
        'user_name': registerParams.userName,
        'email': registerParams.email,
        'password': registerParams.password,
        'password_confirmation': registerParams.password,
      });
      var response = await _dio.post(
        '${Constants.userUrl}/register',
        data: fromData,
      );

      return response;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }

  Future<dynamic> callLoginApi(LoginParams loginParams) async {
    try {
      var fromData = FormData.fromMap({
        'email': loginParams.email,
        'password': loginParams.password,
      });
      var response = await _dio.post(
        '${Constants.userUrl}/login',
        data: fromData,
      );

      return response;
    } on DioException catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }
}
