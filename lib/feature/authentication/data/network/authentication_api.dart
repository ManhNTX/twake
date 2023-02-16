import 'dart:math';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:twake/core/data/dio_client.dart';
import 'package:twake/core/data/endpoints.dart';
import 'package:twake/feature/authentication/data/model/sign_up.dart';
import 'package:twake/feature/authentication/domain/model/exception/signup_exception.dart';

class AuthenticationAPI {
  final DioClient _dioClient;

  AuthenticationAPI(this._dioClient);

  Future<bool> signup(
      {required String email,
      required String secretToken,
      required String code,
      bool createAccountOnly = false}) async {
    try {
      final prefix = email.split('@').first;
      final name = prefix[0].toUpperCase() + prefix.substring(1);
      await _dioClient.post(
        endpoint: Endpoint.signup,
        data: SignUpRequestBody(
          email,
          name,
          'My company',
          _generatePassword(),
          'en',
          secretToken,
          code,
        ).toJson(),
        queryParameters: SignUpRequestQueryParameters(
          createAccountOnly,
        ).toJson(),
        key: 'email',
      );
    } on DioError catch (e) {
      Logger().e('Error signing up the user: $e');
      if (e.response?.statusCode == 409) {
        throw EmailExistsException();
      } else {
        throw SignupFailException();
      }
    }
    return true;
  }

  String _generatePassword() {
    final generator = Random.secure();
    List<int> pass = [];
    pass.add(generator.nextInt(26) + 65);
    pass.add(generator.nextInt(26) + 97);
    pass.add(generator.nextInt(10) + 48);
    pass.add(generator.nextInt(6) + 59);

    final cycles = generator.nextInt(10) + 10;

    for (int i = 0; i < cycles; i++) {
      pass.add(generator.nextInt(26) + (i % 2 == 0 ? 97 : 65));
    }
    final len = pass.length;
    for (int i = 0; i < len; i++) {
      final to = generator.nextInt(len);
      final from = generator.nextInt(len) + 1;
      final t = pass[to];
      pass[to] = pass[len - from];
      pass[len - from] = t;
    }

    return String.fromCharCodes(pass);
  }
}
