part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthDone extends AuthState {
  final LocalUser user;

  AuthDone(this.user);

  @override
  List<Object> get props => [user];

  @override
  bool get stringify => true;
}

class AuthFailure extends AuthState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
