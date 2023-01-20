import 'package:get/get.dart';
import 'package:news_app_getx/core/repository/news_repo.dart';
import '../../../core/models/article.dart';
import '../../../core/repository/news_repo_impl.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepo newsRepo;
  late RxList<Article> articles;
  RxBool isLoading = false.obs;

  NewsHeadlineController() {
    newsRepo = Get.find<NewsRepoImpl>();
    loadNewsHeadlines();
  }

  loadNewsHeadlines() async {
    showLoading();
    final result = await newsRepo.getNewsHeadline();
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
