import 'package:get/get.dart';
import 'package:news_app_getx/core/repository/news_repo_impl.dart';
import 'package:news_app_getx/features/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }
}
