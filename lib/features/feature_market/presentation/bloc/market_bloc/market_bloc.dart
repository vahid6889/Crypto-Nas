import 'package:bloc/bloc.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/core/usecase/use_case.dart';
import 'package:crypto_nas/features/feature_market/domain/use_cases/get_all_crypto_usecase.dart';
import 'package:crypto_nas/features/feature_market/presentation/bloc/market_bloc/all_crypto_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final GetAllCryptoUseCase _getAllCryptoUseCase;
  MarketBloc(
    this._getAllCryptoUseCase,
  ) : super(MarketState(allCryptoStatus: AllCryptoLoading())) {
    on<LoadAllCryptoEvent>(
      (event, emit) async {
        emit(state.copyWith(newAllCryptoStatus: AllCryptoLoading()));

        DataState dataState = await _getAllCryptoUseCase(NoParams());

        if (dataState is DataSuccess) {
          emit(state.copyWith(
              newAllCryptoStatus: AllCryptoCompleted(dataState.data)));
        }

        if (dataState is DataFailed) {
          emit(state.copyWith(
              newAllCryptoStatus: AllCryptoError(dataState.error!)));
        }
      },
    );
  }
}
