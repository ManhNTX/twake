part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class SignupEvent extends AuthenticationEvent {
  final String email;
  final String secretToken;
  final String code;

  SignupEvent(
    this.email,
    this.secretToken,
    this.code,
  );

  @override
  List<Object?> get props => [
        email,
        secretToken,
        code,
      ];
}
