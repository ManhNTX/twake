import 'package:dartz/dartz.dart';
import 'package:twake/core/domain/state/failure.dart';
import 'package:twake/core/domain/state/success.dart';
import 'package:twake/feature/authentication/domain/model/state/signup_state.dart';
import 'package:twake/feature/authentication/domain/repository/authentication_repository.dart';

class SignupUseCase {
  final AuthenticationRepository _autoCompleteRepository;

  SignupUseCase(this._autoCompleteRepository);

  Future<Either<Failure, Success>> execute({
    required String email,
    required String secretToken,
    required String code,
    bool createAccountOnly = false,
  }) async {
    try {
      await _autoCompleteRepository.signUp(
        email: email,
        secretToken: secretToken,
        code: code,
        createAccountOnly: createAccountOnly,
      );
      return Right<Failure, Success>(SignupSuccess());
    } catch (e) {
      return Left<Failure, Success>(SignupFailure(e));
    }
  }
}
