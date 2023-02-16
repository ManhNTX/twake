import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:twake/feature/authentication/domain/model/state/signup_state.dart';
import 'package:twake/feature/authentication/domain/usecase/signup_usecase.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignupUseCase _signupUseCase;

  AuthenticationBloc(this._signupUseCase) : super(AuthenticationInitial()) {
    on<SignupEvent>(_handleSignupEvent);
  }

  FutureOr<void> _handleSignupEvent(
    SignupEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(RegistrationAwaiting());
    _signupUseCase
        .execute(
      email: event.email,
      secretToken: event.secretToken,
      code: event.code,
    )
        .then((value) {
      if (value is SignupSuccess) {
        //TODO: SignupSuccess
        emit(RegistrationSuccess(email: event.email));
      } else if (value is SignupFailure) {
        //TODO: SignupFailure
        emit(RegistrationFailed(emailExists: false, email: event.email));
      }
    }, onError: (error) {
      debugPrint(
          'AuthenticationBloc:: _handleSignupEvent error: ${error.toString()}');
    });
  }
}
