import 'package:dio/dio.dart';
import 'package:schoolgate/core/di/injector.dart';
import 'package:schoolgate/core/services/utils/storage_service.dart';

class AppInterceptor extends Interceptor {
  final StorageService _storageService = di<StorageService>();
  AppInterceptor();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // print('the token: ' + _storageService.getToken()!);
    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");
      options.headers.addAll({
        "authorization": "Bearer ${_storageService.getToken()}",
        "accept": "application/json",
        "content-type": "application/json"
      });
    } else if (options.headers.containsKey("requiresToken") &&
        options.headers.containsKey("isFileUpload")) {
      options.headers.remove("requiresToken");
      options.headers.remove("isFileUpload");
      options.headers.addAll({
        "authorization": "Bearer ${_storageService.getToken()}",
        "accept": "application/json",
        "content-type": "multipart/form-data"
      });
    } else {
      options.headers.addAll({
        "content-Type": "application/json",
        "accept": "application/json",
      });
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
    if (response != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 400) {
      response.statusCode = 200;
    }
    if (response.statusCode == 422) {
      response.statusCode = 200;
    } else if (response.statusCode == 401) {
      // Todo handle logout
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    // ApiError.fromDio(err);
  }
}
