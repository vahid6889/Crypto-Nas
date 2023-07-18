import 'package:crypto_nas/core/utils/prefs_operator.dart';
import 'package:crypto_nas/features/feature_home/data/data_source/remote/api_provider_home.dart';
import 'package:crypto_nas/features/feature_home/data/repository/home_repositoryImpl.dart';
import 'package:crypto_nas/features/feature_home/domain/repository/home_repository.dart';
import 'package:crypto_nas/features/feature_home/domain/use_cases/get_top_gainer_usecase.dart';
import 'package:crypto_nas/features/feature_home/domain/use_cases/get_top_loser_usecase.dart';
import 'package:crypto_nas/features/feature_home/domain/use_cases/get_top_market_cap_usecase.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:crypto_nas/features/feature_market/data/data_source/remote/api_provider_market.dart';
import 'package:crypto_nas/features/feature_market/data/repository/market_repositoryImpl.dart';
import 'package:crypto_nas/features/feature_market/domain/repository/market_repository.dart';
import 'package:crypto_nas/features/feature_market/domain/use_cases/get_all_crypto_usecase.dart';
import 'package:crypto_nas/features/feature_market/presentation/bloc/market_bloc/market_bloc.dart';
import 'package:crypto_nas/features/feature_profile/data/data_source/remote/api_provider_profile.dart';
import 'package:crypto_nas/features/feature_profile/data/repository/profile_repositoryImpl.dart';
import 'package:crypto_nas/features/feature_profile/domain/repository/profile_repository.dart';
import 'package:crypto_nas/features/feature_profile/domain/use_cases/call_login_usecase.dart';
import 'package:crypto_nas/features/feature_profile/domain/use_cases/call_register_usecase.dart';
import 'package:crypto_nas/features/feature_profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<ApiProviderHome>(ApiProviderHome());
  locator.registerSingleton<ApiProviderMarket>(ApiProviderMarket());
  locator.registerSingleton<ApiProviderProfile>(ApiProviderProfile());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());

  /// repositories
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));
  locator.registerSingleton<MarketRepository>(MarketRepositoryImpl(locator()));
  locator
      .registerSingleton<ProfileRepository>(ProfileRepositoryImpl(locator()));

  /// use case
  locator.registerSingleton<GetTopMarketCapUseCase>(
      GetTopMarketCapUseCase(locator()));
  locator
      .registerSingleton<GetTopGainerUseCase>(GetTopGainerUseCase(locator()));
  locator.registerSingleton<GetTopLoserUseCase>(GetTopLoserUseCase(locator()));
  locator
      .registerSingleton<GetAllCryptoUseCase>(GetAllCryptoUseCase(locator()));
  locator
      .registerSingleton<CallRegisterUseCase>(CallRegisterUseCase(locator()));
  locator.registerSingleton<CallLoginUseCase>(CallLoginUseCase(locator()));

  /// bloc features
  locator.registerSingleton(HomeBloc(locator(), locator(), locator()));
  locator.registerSingleton(MarketBloc(locator()));
  locator.registerSingleton(ProfileBloc(locator(), locator()));
}
