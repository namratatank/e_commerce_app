import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/blocs/auth/auth_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/auth/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
      status: LoginStatus.initial,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      status: LoginStatus.initial,
    ));
  }

  Future<void> loginWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.loginWithEmailAndPassword(
          email: state.email, password: state.password);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }

  Future<void> loginWithGoogle() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.signInWithGoogle();
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }
}
