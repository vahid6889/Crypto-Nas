import 'package:bloc/bloc.dart';
import 'package:crypto_nas/core/resources/data_state.dart';
import 'package:crypto_nas/core/usecase/use_case.dart';
import 'package:crypto_nas/features/feature_home/domain/use_cases/get_top_gainer_usecase.dart';
import 'package:crypto_nas/features/feature_home/domain/use_cases/get_top_loser_usecase.dart';
import 'package:crypto_nas/features/feature_home/domain/use_cases/get_top_market_cap_usecase.dart';
// import 'package:crypto_nas/features/feature_home/presentation/bloc/home_bloc/top_gainer_status.dart';
// import 'package:crypto_nas/features/feature_home/presentation/bloc/home_bloc/top_loser_status.dart';
import 'package:crypto_nas/features/feature_home/presentation/bloc/home_bloc/top_market_cap_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTopMarketCapUseCase _getTopMarketCapUseCase;
  final GetTopGainerUseCase _getTopGainerUseCase;
  final GetTopLoserUseCase _getTopLoserUseCase;
  HomeBloc(
    this._getTopMarketCapUseCase,
    this._getTopGainerUseCase,
    this._getTopLoserUseCase,
  ) : super(
          HomeState(
            topMarketCapStatus: TopMarketCapLoading(),
            // topGainerStatus: TopGainerLoading(),
            // topLoserStatus: TopLoserLoading(),
          ),
        ) {
    on<LoadTopMarketCapEvent>(
      (event, emit) async {
        emit(state.copyWith(newTopMarketCapStatus: TopMarketCapLoading()));

        DataState dataState = await _getTopMarketCapUseCase(NoParams());

        if (dataState is DataSuccess) {
          emit(state.copyWith(
              newTopMarketCapStatus: TopMarketCapCompleted(dataState.data)));
        }

        if (dataState is DataFailed) {
          emit(state.copyWith(
              newTopMarketCapStatus: TopMarketCapError(dataState.error!)));
        }
      },
    );
    on<LoadTopGainerEvent>(
      (event, emit) async {
        emit(state.copyWith(newTopMarketCapStatus: TopMarketCapLoading()));

        DataState dataState = await _getTopGainerUseCase(NoParams());

        if (dataState is DataSuccess) {
          emit(state.copyWith(
              newTopMarketCapStatus: TopMarketCapCompleted(dataState.data)));
        }

        if (dataState is DataFailed) {
          emit(state.copyWith(
              newTopMarketCapStatus: TopMarketCapError(dataState.error!)));
        }
      },
    );
    on<LoadTopLoserEvent>(
      (event, emit) async {
        emit(state.copyWith(newTopMarketCapStatus: TopMarketCapLoading()));

        DataState dataState = await _getTopLoserUseCase(NoParams());

        if (dataState is DataSuccess) {
          emit(state.copyWith(
              newTopMarketCapStatus: TopMarketCapCompleted(dataState.data)));
        }

        if (dataState is DataFailed) {
          emit(state.copyWith(
              newTopMarketCapStatus: TopMarketCapError(dataState.error!)));
        }
      },
    );
  }
}
