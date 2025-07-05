import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pemo_test_project/core/network/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A network service class that uses Dio for making HTTP requests.
class DioNetworkService {
  /// Creates a [DioNetworkService] instance.
  ///
  /// The [dio] instance is configured with a base URL, timeouts, and interceptors.
  DioNetworkService(this.dio) {
    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) =>
          status != null && status >= 200 && status < 400,
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(requestBody: true, requestHeader: true),
      );
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // TODO: Add language, locale, tenant, and auth tokens as in the example
          // options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
          return handler.next(options);
        },
        onError: (e, handler) {
          // TODO: Add 401 handling to redirect to login
          return handler.next(e);
        },
      ),
    );
  }

  /// The Dio instance used for making network requests.
  final Dio dio;
}
