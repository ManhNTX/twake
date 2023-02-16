import 'package:dio/dio.dart';
import 'package:sprintf/sprintf.dart';
import 'package:twake/core/data/endpoints.dart';

class DynamicUrlInterceptors extends InterceptorsWrapper {
  String? _baseUrl;

  void changeBaseUrl(String? url) {
    _baseUrl = url;
  }

  String? get baseUrl => _baseUrl;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_baseUrl != null) {
      options.baseUrl = _baseUrl!;
    }
    if (Endpoint.isConsole(options.path)) {
      final baseHost = options.baseUrl.split('.').skip(1).join('.');
      options.path = sprintf(options.path, [baseHost]);
    }
    if (Endpoint.isPublic(options.path)) {
      handler.next(options);
      return;
    }
    super.onRequest(options, handler);
  }
}
