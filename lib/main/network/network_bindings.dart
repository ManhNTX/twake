import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:twake/core/data/dio_client.dart';
import 'package:twake/core/data/interceptor/dynamic_url_interceptors.dart';
import 'package:twake/feature/authentication/login/data/network/interceptors/authentication_interceptors.dart';

class NetworkBindings extends Bindings {
  @override
  void dependencies() {
    _bindingConnection();
    _bindingDio();
    _bindingApi();
    _bindingException();
  }

  void _bindingBaseOption() {
    final options = BaseOptions(
      contentType: 'application/json',
      connectTimeout: 60 * 1000, // 60 seconds to connect
      receiveTimeout: 30 * 1000, // 30 seconds to receive data
    );
    Get.put(options);
  }

  void _bindingDio() {
    _bindingBaseOption();
    Get.put(Dio(Get.find<BaseOptions>()));
    Get.put(DioClient(Get.find<Dio>()));
    _bindingInterceptors();
  }

  void _bindingInterceptors() {
    Get.put(DynamicUrlInterceptors());
    Get.put(AuthorizationInterceptors());
    Get.find<Dio>().interceptors.add(Get.find<DynamicUrlInterceptors>());
    Get.find<Dio>().interceptors.add(Get.find<AuthorizationInterceptors>());
    if (kDebugMode) {
      Get.find<Dio>().interceptors.add(LogInterceptor(requestBody: true));
    }
  }

  void _bindingApi() {}

  void _bindingConnection() {
    Get.put(Connectivity());
  }

  void _bindingException() {}
}
