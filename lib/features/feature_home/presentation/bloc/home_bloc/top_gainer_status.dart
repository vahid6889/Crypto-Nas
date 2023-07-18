import 'package:crypto_nas/features/feature_home/domain/entities/top_market_coin_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TopGainerStatus extends Equatable {}

class TopGainerInitial extends TopGainerStatus {
  @override
  List<Object?> get props => [];
}

class TopGainerLoading extends TopGainerStatus {
  @override
  List<Object?> get props => [];
}

class TopGainerCompleted extends TopGainerStatus {
  final TopMarketCoinEntity topMarketCoinEntity;

  TopGainerCompleted(this.topMarketCoinEntity);

  @override
  List<Object?> get props => [topMarketCoinEntity];
}

class TopGainerError extends TopGainerStatus {
  final String message;

  TopGainerError(this.message);

  @override
  List<Object?> get props => [message];
}
