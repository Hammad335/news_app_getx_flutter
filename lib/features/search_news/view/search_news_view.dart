import 'package:flutter/material.dart';
import 'package:news_app_getx/core/widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/core/widgets/news_list_view.dart';
import 'package:news_app_getx/features/search_news/controller/search_news_controller.dart';

class SearchNewsView extends StatelessWidget {
  final _controller = Get.find<SearchNewsController>();
  SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search News'),
      ),
      drawer: getAppDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _controller.searchTextController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search news here',
                ),
              ),
              const SizedBox(height: 22),
              Expanded(
                child: Obx(() {
                  return _controller.isLoading.isTrue
                      ? const Center(child: CircularProgressIndicator())
                      : _controller.articles.isEmpty
                          ? const Center(
                              child: Text('No news found'),
                            )
                          : NewsListView(controller: _controller);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
