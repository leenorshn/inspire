part of 'care_bloc.dart';

@immutable
abstract class CareState {}

class CareInitial extends CareState {}

class CareLoadedSuccess extends CareState {
  final List<Care> cares;

  CareLoadedSuccess(this.cares);
}

class CareLoadedFailure extends CareState {}
