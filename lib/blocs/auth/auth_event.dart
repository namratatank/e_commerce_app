part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AppLogoutRequested extends AuthEvent{
  const AppLogoutRequested();
}

class AuthUserChanged extends AuthEvent{
  final UserModel? userModel;
  AuthUserChanged({this.userModel});

  @override
  List<Object?> get props => [userModel];
}