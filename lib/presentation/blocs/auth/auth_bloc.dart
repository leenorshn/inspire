import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psony/data/models/local_user.dart';
import 'package:psony/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial());

  late StreamSubscription _subscription;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthStartedEvent) {
      try {
        _subscription.cancel();
        _subscription = authRepository
            .onAuthStateChanged()
            .listen((event) => add(AuthUpdatedEvent(event)));
      } catch (ex) {
        yield AuthFailure();
      }
    }
    if (event is AuthUpdatedEvent) {
      if (event.user == null) {
        yield AuthFailure();
      } else {
        LocalUser? user = await authRepository.getUser();
        if (user == null) {
          yield AuthFailure();
        } else {
          yield AuthDone(user);
        }
      }
    }
    if (event is Loggout) {
      await authRepository.logout();
      add(AuthUpdatedEvent(null));
      yield AuthInitial();
    }
    if (event is AddUserEvent) {
      await authRepository.addUser(
          name: event.name,
          phone: event.phone,
          uid: event.uid,
          gender: event.gender);
      LocalUser? user = await authRepository.getUser();
      if (user == null) {
        yield AuthFailure();
      } else {
        yield AuthDone(user);
      }
    }
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    print(transition);
    super.onTransition(transition);
  }
}
