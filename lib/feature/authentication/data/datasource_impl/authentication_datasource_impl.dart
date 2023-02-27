import 'package:twake/feature/authentication/data/datasource/authentication_datasource.dart';
import 'package:twake/feature/authentication/data/network/authentication_api.dart';

class AuthenticationDatasourceImpl extends AuthenticationDatasource {
  final AuthenticationAPI _authenticationAPI;

  AuthenticationDatasourceImpl(this._authenticationAPI);

  @override
  Future<bool> signUp({
    required String email,
    required String secretToken,
    required String code,
    bool createAccountOnly = false,
  }) {
    return _authenticationAPI.signup(
      email: email,
      secretToken: secretToken,
      code: code,
    );
  }
}
