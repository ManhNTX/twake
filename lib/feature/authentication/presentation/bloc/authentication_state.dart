part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class RegistrationReady extends AuthenticationState {
  final String secretToken;
  final String code;

  const RegistrationReady({required this.secretToken, required this.code});

  @override
  List<Object?> get props => [secretToken];
}

class RegistrationSuccess extends AuthenticationState {
  final String email;

  const RegistrationSuccess({required this.email});

  @override
  List<Object?> get props => [email];
}

class RegistrationFailed extends AuthenticationState {
  final String email;
  final bool emailExists;

  const RegistrationFailed({
    required this.email,
    required this.emailExists,
  });

  @override
  List<Object?> get props => [email];
}

class EmailResendSuccess extends AuthenticationState {
  const EmailResendSuccess();

  @override
  List<Object?> get props => [];
}

class EmailResendFailed extends AuthenticationState {
  const EmailResendFailed();

  @override
  List<Object?> get props => [];
}

class RegistrationAwaiting extends AuthenticationState {
  const RegistrationAwaiting();

  @override
  List<Object?> get props => [];
}
