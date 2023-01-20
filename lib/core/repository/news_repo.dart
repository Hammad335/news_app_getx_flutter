import 'package:news_app_getx/core/models/article.dart';

abstract class NewsRepo {
  Future<List<Article>?> getNewsHeadline();
  Future<List<Article>?> getSearchNews(String query);
}
