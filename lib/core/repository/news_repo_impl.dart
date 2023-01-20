import 'package:news_app_getx/core/models/article.dart';
import 'package:news_app_getx/core/models/news_response_model.dart';
import 'package:news_app_getx/core/repository/news_repo.dart';
import 'package:news_app_getx/services/http_service.dart';
import 'package:news_app_getx/services/http_service_impl.dart';
import 'package:get/get.dart';

class NewsRepoImpl implements NewsRepo {
  late HttpService _httpService;

  NewsRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>?> getNewsHeadline() async {
    try {
      final response =
          await _httpService.getRequest(url: 'v2/top-headlines?country=us');
      final parsedResponse = NewsResponseModel.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<List<Article>?> getSearchNews(String query) async {
    try {
      final response =
          await _httpService.getRequest(url: 'v2/everything?q=$query');
      final parsedResponse = NewsResponseModel.fromJson(response.data);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
