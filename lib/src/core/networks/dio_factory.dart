import 'package:dio/dio.dart';
import 'package:home_decor/src/core/networks/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.apiBaseUrl,
          receiveDataWhenStatusError: true,
        ),
      );
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.get(
      endPoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio!.get(
      endPoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };

    return dio!.post(
      endPoint,
      data: data,
    );
  }

  static Future<Response> postDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json;charset=utf-8',
    };

    return await dio!.post(
      endPoint,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchUserImageUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? image,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'multipart/form-data',
    };

    return dio!.patch(
      endPoint,
      queryParameters: query,
      data: image,
    );
  }

  static Future<Response> putDataUseToken({
    required String endPoint,
    required Object? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };

    return dio!.put(
      endPoint,
      data: data,
    );
  }

  static Future<Response> deleteDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };

    return dio!.delete(
      endPoint,
      queryParameters: query,
    );
  }

  static Future<Response> patchDataUseToken({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
    };

    return dio!.patch(
      endPoint,
      queryParameters: query,
      data: data,
    );
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
