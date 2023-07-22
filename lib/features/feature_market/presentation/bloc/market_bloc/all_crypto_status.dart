import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AllCryptoStatus extends Equatable {}

class AllCryptoInitial extends AllCryptoStatus {
  @override
  List<Object?> get props => [];
}

class AllCryptoLoading extends AllCryptoStatus {
  @override
  List<Object?> get props => [];
}

class AllCryptoCompleted extends AllCryptoStatus {
  final TopMarketCoinEntity topMarketCoinEntity;

  AllCryptoCompleted(this.topMarketCoinEntity);

  @override
  List<Object?> get props => [topMarketCoinEntity];
}

class AllCryptoError extends AllCryptoStatus {
  final String message;

  AllCryptoError(this.message);

  @override
  List<Object?> get props => [message];
}
