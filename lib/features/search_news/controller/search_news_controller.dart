import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/models/article.dart';
import '../../../core/repository/news_repo.dart';
import '../../../core/repository/news_repo_impl.dart';

class SearchNewsController extends GetxController {
  late NewsRepo newsRepo;
  RxList<Article> articles = RxList();
  RxBool isLoading = false.obs;
  final searchTextController = TextEditingController();

  SearchNewsController() {
    newsRepo = Get.find<NewsRepoImpl>();
    searchTextController.addListener(() {
      if (searchTextController.text.isNotEmpty &&
          searchTextController.text.length % 3 == 0) {
        searchNewsHeadlines();
      } else if (searchTextController.text.isEmpty && articles.isNotEmpty) {
        articles.clear();
      }
    });
  }

  Future<void> searchNewsHeadlines() async {
    showLoading();
    final result = await newsRepo.getSearchNews(searchTextController.text);
    hideLoading();
    if (null != result) {
      articles = result.obs;
    } else {
      print('no data received');
    }
  }

  showLoading() => isLoading.toggle();
  hideLoading() => isLoading.toggle();
}
