// import 'package:crypto_nas/features/feature_profile/data/models/Data.dart';
import 'package:crypto_nas/features/feature_profile/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final bool? success;
  final dynamic errorCode;
  final String? message;
  final Data? data;

  const UserEntity({
    this.success,
    this.errorCode,
    this.message,
    this.data,
  });

  @override
  List<Object?> get props => [
        success,
        errorCode,
        message,
        data,
      ];
}
