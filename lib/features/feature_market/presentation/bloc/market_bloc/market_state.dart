part of 'market_bloc.dart';

// ignore: must_be_immutable
class MarketState extends Equatable {
  AllCryptoStatus allCryptoStatus;

  MarketState({
    required this.allCryptoStatus,
  });

  MarketState copyWith({
    AllCryptoStatus? newAllCryptoStatus,
  }) {
    return MarketState(
      allCryptoStatus: newAllCryptoStatus ?? allCryptoStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        allCryptoStatus,
      ];
}
