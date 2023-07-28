import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterStatus extends Equatable {}

class RegisterInitial extends RegisterStatus {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterStatus {
  @override
  List<Object?> get props => [];
}

class RegisterCompleted extends RegisterStatus {
  final UserEntity? profileEntity;

  RegisterCompleted(this.profileEntity);

  @override
  List<Object?> get props => [profileEntity];
}

class RegisterError extends RegisterStatus {
  final String message;

  RegisterError(this.message);

  @override
  List<Object?> get props => [message];
}
