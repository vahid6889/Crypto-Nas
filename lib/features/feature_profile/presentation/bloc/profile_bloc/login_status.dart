import 'package:crypto_nas/features/feature_profile/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginStatus extends Equatable {}

class LoginInitial extends LoginStatus {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginStatus {
  @override
  List<Object?> get props => [];
}

class LoginCompleted extends LoginStatus {
  final UserEntity profileEntity;

  LoginCompleted(this.profileEntity);

  @override
  List<Object?> get props => [profileEntity];
}

class LoginError extends LoginStatus {
  final String message;

  LoginError(this.message);

  @override
  List<Object?> get props => [message];
}
