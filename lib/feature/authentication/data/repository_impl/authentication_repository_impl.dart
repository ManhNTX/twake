import 'package:twake/feature/authentication/data/datasource/authentication_datasource.dart';
import 'package:twake/feature/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDatasource _authenticationDatasource;

  AuthenticationRepositoryImpl(this._authenticationDatasource);

  @override
  Future<bool> signUp({
    required String email,
    required String secretToken,
    required String code,
    bool createAccountOnly = false,
  }) {
    return _authenticationDatasource.signUp(
      email: email,
      secretToken: secretToken,
      code: code,
    );
  }
}
