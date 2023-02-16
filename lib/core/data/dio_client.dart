import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic> queryParameters: const {},
    CancelToken? cancelToken,
    String? key,
  }) async {
    final r = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
    return key != null ? r.data[key] : r.data;
  }

  Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic> queryParameters: const {},
    required dynamic data,
    Function(int, int)? onSendProgress,
    CancelToken? cancelToken,
    String? key,
  }) async {
    final r = await _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: data,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
    return key == null ? r.data : r.data[key];
  }

  Future<dynamic> put({
    required String endpoint,
    required dynamic data,
    CancelToken? cancelToken,
    String? key,
  }) async {
    final r = await _dio.put(
      endpoint,
      data: data,
      cancelToken: cancelToken,
    );
    return key == null ? r.data : r.data[key];
  }

  Future<dynamic> patch({
    required String endpoint,
    required dynamic data,
    CancelToken? cancelToken,
  }) async {
    final r = await _dio.patch(
      endpoint,
      data: data,
      cancelToken: cancelToken,
    );
    return r.data;
  }

  Future<dynamic> delete({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    final r = await _dio.delete(
      endpoint,
      data: data,
    );
    return r.data;
  }
}
