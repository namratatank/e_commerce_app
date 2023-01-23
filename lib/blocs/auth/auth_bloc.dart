import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/repositories/auth/auth_repository.dart';
import 'package:e_commerce_app/repositories/user/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  StreamSubscription<auth.User?>? _authUserSubscription;
  StreamSubscription<UserModel?>? _userSubscription;

  AuthBloc(
      {required AuthRepository authRepository,
      required UserRepository userRepository})
      : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);

    _authUserSubscription = _authRepository.user.listen((authentic) {
      print('Auth user : $authentic');
      if (authentic != null) {
        _userRepository.getUser(authentic.uid).listen((user) {
          add(AuthUserChanged(
            authUser: authentic,
            userModel: user,
          ));
        });
      } else {
        add(
          AuthUserChanged(
            authUser: authentic,
          ),
        );
      }
    });
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.authUser != null
        ? emit(AuthState.authenticated(
            authUser: event.authUser!,
            userModel: event.userModel!,
          ))
        : emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}
