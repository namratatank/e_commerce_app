part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AppLogoutRequested extends AuthEvent{}

class AuthUserChanged extends AuthEvent{
  final auth.User? authUser;
  final UserModel? userModel;
  AuthUserChanged({required this.authUser, this.userModel});

  @override
  List<Object?> get props => [authUser, userModel];
}