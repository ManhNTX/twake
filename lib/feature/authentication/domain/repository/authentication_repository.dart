
abstract class AuthenticationRepository {
  Future<bool> signUp({
    required String email,
    required String secretToken,
    required String code,
    bool createAccountOnly = false,
  });
}