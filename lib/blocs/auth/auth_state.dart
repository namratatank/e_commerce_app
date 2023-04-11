part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

 class AuthState extends Equatable {
  final AuthStatus status;
  final UserModel? userModel;

  const AuthState._(
      {required this.status , this.userModel});

  const AuthState.authenticated({
    required UserModel userModel,
  }) : this._(
          status: AuthStatus.authenticated,
          userModel: userModel,
        );

  const AuthState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
        );
  @override
  List<Object?> get props => [status, userModel];
}

