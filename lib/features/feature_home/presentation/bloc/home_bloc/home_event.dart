part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadTopMarketCapEvent extends HomeEvent {}

class LoadTopGainerEvent extends HomeEvent {}

class LoadTopLoserEvent extends HomeEvent {}
