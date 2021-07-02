part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class AuthStartedEvent extends AuthEvent {}

class AddUserEvent extends AuthEvent {
  final String name;
  final String phone;
  final String gender;
  final String uid;

  AddUserEvent(
      {required this.name,
      required this.phone,
      required this.gender,
      required this.uid});
}

class AuthUpdatedEvent extends AuthEvent {
  final User? user;

  AuthUpdatedEvent(this.user);
  @override
  List<Object> get props => [this.user!];

  @override
  bool get stringify => true;
}

class Loggout extends AuthEvent {}
