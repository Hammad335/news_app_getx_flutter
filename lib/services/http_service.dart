import 'package:dio/dio.dart';

abstract class HttpService {
  void init();
  Future<Response> getRequest({required String url});
}
