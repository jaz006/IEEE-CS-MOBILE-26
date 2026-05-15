import 'package:dio/dio.dart';
import 'package:task_18/core/api/api_consumer.dart';
import 'package:task_18/core/api/api_interceptors.dart';
import 'package:task_18/core/api/end_points.dart';
import 'package:task_18/core/errors/error_model.dart';
import 'package:task_18/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  late final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor());
    request:
    true;
    requestHeader:
    true;
    requestBody:
    true;
    responseHeader:
    true;
    error:
    true;
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryparameters,
    bool isFromData=false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData?FormData.fromMap(data): data,
        queryParameters: queryparameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryparameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryparameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data:isFromData?FormData.fromMap(data): data,
        queryParameters: queryparameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryparameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data:isFromData?FormData.fromMap(data): data,
        queryParameters: queryparameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
