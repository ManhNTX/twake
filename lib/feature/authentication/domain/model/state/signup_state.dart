import 'package:twake/core/domain/state/failure.dart';
import 'package:twake/core/domain/state/success.dart';

class SignupSuccess extends Success {
  @override
  List<Object?> get props => [];
}

class SignupFailure extends Failure {
   final dynamic exception;

  SignupFailure(this.exception);

  @override
  List<Object?> get props => [
        exception,
      ];
}
