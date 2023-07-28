import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TopMarketCapStatus extends Equatable {}

class TopMarketCapInitial extends TopMarketCapStatus {
  @override
  List<Object?> get props => [];
}

class TopMarketCapLoading extends TopMarketCapStatus {
  @override
  List<Object?> get props => [];
}

class TopMarketCapCompleted extends TopMarketCapStatus {
  final TopMarketCoinEntity? topMarketCoinEntity;

  TopMarketCapCompleted(this.topMarketCoinEntity);

  @override
  List<Object?> get props => [topMarketCoinEntity];
}

class TopMarketCapError extends TopMarketCapStatus {
  final String message;

  TopMarketCapError(this.message);

  @override
  List<Object?> get props => [message];
}
