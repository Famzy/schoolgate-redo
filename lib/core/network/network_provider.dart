import 'package:dio/dio.dart';
import 'package:schoolgate/core/models/error_response_model.dart';
import 'package:schoolgate/utils/utils.dart';
import 'app_interceptor.dart';

/// To use this class just call
/// final networkProvider = NetworkProvider();
// networkProvider.call(path, method);
/// This class should be injected to all your services class that need to make network calls
class NetworkProvider {
  static const int CONNECT_TIME_OUT = 30000;
  static const int RECEIVE_TIME_OUT = 30000;
  Dio? dio;
  NetworkProvider(
      {String baseUrl = EnvironmentConfig.BASE_URL, String? authToken}) {
    dio = Dio(
      BaseOptions(
          connectTimeout: CONNECT_TIME_OUT,
          receiveTimeout: RECEIVE_TIME_OUT,
          baseUrl: baseUrl),
    );
    dio!.interceptors
      ..add(LogInterceptor(
          requestBody: true, responseBody: true, requestHeader: true))
      ..add(AppInterceptor());
  }
  NetworkProvider.test(this.dio);
  Future<Response> call(
    String path,
    RequestMethod method, {
    Map<String, dynamic>? queryParams,
    data,
    Options? options,
    FormData? formData,
  }) async {
    Response response;
    var params = queryParams ?? <String, dynamic>{};
    params.addAll(requiredParams);
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio!.post(path,
              queryParameters: params, data: data, options: options);
          break;
        case RequestMethod.get:
          response =
              await dio!.get(path, queryParameters: params, options: options);
          break;
        case RequestMethod.put:
          response = await dio!
              .put(path, queryParameters: params, data: data, options: options);
          break;
        case RequestMethod.delete:
          response = await dio!.delete(path,
              queryParameters: params, data: data, options: options);
          break;
        case RequestMethod.upload:
          response = await dio!.post(path,
              queryParameters: params, data: data, options: options);
          break;
      }
      if (response.data['status_code'] != null &&
          response.data['status_code'] != 200) {
        ErrorResponse e = ErrorResponse.fromJson(response.data);
        return Future.error(e);
      }
      return response;
    } on DioError catch (error) {
      // ApiError apiError = ApiError.fromDio(error);
      // return Future.error(error);
      ErrorResponse e = ErrorResponse.fromJson(error.response!.data);
      return Future.error(e);
    }
  }

  Map<String, dynamic> get requiredParams {
    //Todo add all required params for your endpoint here if any
    var params = <String, dynamic>{};
    return params;
  }
}

enum RequestMethod { post, get, put, delete, upload }
