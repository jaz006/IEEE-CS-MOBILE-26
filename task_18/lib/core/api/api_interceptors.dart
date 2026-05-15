import 'package:dio/dio.dart';
import 'package:task_18/cache/cache_helper.dart';
import 'package:task_18/core/api/end_points.dart';

class ApiInterceptors extends Interceptor {
  @override
 void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    options.headers[ApiKey.token] = CacheHelper().getData(key: ApiKey.token)!=null? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}' :null
    ;
    super.onRequest(options, handler);
  }
}
