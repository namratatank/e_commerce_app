import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/auth/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;
  SignUpCubit(this._authRepository) : super(SignUpState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
      status: SignupStatus.initial,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      status: SignupStatus.initial,
    ));
  }

  Future<void> signupFormSubmitted() async {
    if (state.status == SignupStatus.submitting) return;
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);
      emit(state.copyWith(status: SignupStatus.success));
    } catch (_) {}
  }

}
