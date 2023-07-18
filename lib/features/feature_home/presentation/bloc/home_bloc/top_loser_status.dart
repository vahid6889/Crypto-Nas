import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TopLoserStatus extends Equatable {}

class TopLoserInitial extends TopLoserStatus {
  @override
  List<Object?> get props => [];
}

class TopLoserLoading extends TopLoserStatus {
  @override
  List<Object?> get props => [];
}

class TopLoserCompleted extends TopLoserStatus {
  final TopMarketCoinEntity topMarketCoinEntity;

  TopLoserCompleted(this.topMarketCoinEntity);

  @override
  List<Object?> get props => [topMarketCoinEntity];
}

class TopLoserError extends TopLoserStatus {
  final String message;

  TopLoserError(this.message);

  @override
  List<Object?> get props => [message];
}
