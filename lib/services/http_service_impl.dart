// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'package:news_app_getx/services/http_service.dart';

const BASE_URL = 'https://newsapi.org/';
const API_KEY = 'd818a7a9df2347ce893ae9954bdd6b3a';

class HttpServiceImpl implements HttpService {
  late Dio _dio;

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      headers: {'Authorization': 'Bearer $API_KEY'},
    ));
    initializeInterceptors();
  }

  @override
  Future<Response> getRequest({required String url}) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        print('error:  ${error.message}');
        return handler.next(error);
      },
      onRequest: (request, handler) {
        print('${request.method} | ${request.path}');
        return handler.next(request);
      },
      onResponse: (response, handler) {
        print(
            '${response.statusCode} : ${response.statusMessage} : ${response.data}');
        return handler.next(response);
      },
    ));
  }
}
