part of 'home_bloc.dart';

// ignore: must_be_immutable
class HomeState extends Equatable {
  TopMarketCapStatus topMarketCapStatus;
  // TopGainerStatus topGainerStatus;
  // TopLoserStatus topLoserStatus;

  HomeState({
    required this.topMarketCapStatus,
    // required this.topGainerStatus,
    // required this.topLoserStatus,
  });

  HomeState copyWith({
    TopMarketCapStatus? newTopMarketCapStatus,
    // TopGainerStatus? newTopGainerStatus,
    // TopLoserStatus? newTopLoserStatus,
  }) {
    return HomeState(
      topMarketCapStatus: newTopMarketCapStatus ?? topMarketCapStatus,
      // topGainerStatus: newTopGainerStatus ?? topGainerStatus,
      // topLoserStatus: newTopLoserStatus ?? topLoserStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        topMarketCapStatus,
        // topGainerStatus,
        // topLoserStatus,
      ];
}
