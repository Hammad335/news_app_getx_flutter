import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/core/widgets/drawer.dart';
import 'package:news_app_getx/core/widgets/news_list_view.dart';
import 'package:news_app_getx/features/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  final _controller = Get.find<NewsHeadlineController>();
  NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Headline'),
      ),
      drawer: getAppDrawer(),
      body: SafeArea(
        child: Obx(() {
          return _controller.isLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: NewsListView(controller: _controller),
                );
        }),
      ),
    );
  }
}
