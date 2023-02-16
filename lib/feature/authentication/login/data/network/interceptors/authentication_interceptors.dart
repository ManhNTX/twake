import 'dart:io';

import 'package:dio/dio.dart';

class AuthorizationInterceptors extends InterceptorsWrapper {


  String? _token;

  AuthorizationInterceptors();



  void setTokenAndAuthorityOidc({String? newToken}) {
    _token = newToken;
  }

  void updateNewToken({String? newToken}) {
    _token = newToken;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_token != null) {
      options.headers[HttpHeaders.authorizationHeader] = _getTokenAsBearerHeader(_token!);
    }
    super.onRequest(options, handler);
  }

  String _getTokenAsBearerHeader(String token) => 'Bearer $token';

}
