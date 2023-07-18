import 'package:crypto_nas/features/feature_home/data/models/AllCryptoModel.dart';
import 'package:crypto_nas/features/feature_home/data/models/Status.dart';
import 'package:equatable/equatable.dart';

class TopMarketCoinEntity extends Equatable {
  final Status? status;
  final Data? data;

  const TopMarketCoinEntity({
    this.status,
    this.data,
  });

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}
