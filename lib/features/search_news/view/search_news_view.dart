import 'package:flutter/material.dart';
import 'package:news_app_getx/core/widgets/drawer.dart';
import 'package:get/get.dart';
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
                          : ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _controller.articles[index].title
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      _controller.articles[index].desc
                                          .toString(),
                                    ),
                                    const SizedBox(height: 6),
                                    _controller.articles[index].imageUrl == null
                                        ? const SizedBox.shrink()
                                        : Image.network(
                                            _controller
                                                .articles[index].imageUrl!,
                                            fit: BoxFit.fill,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      22.0),
                                                  child: SizedBox(
                                                    width: 25,
                                                    height: 25,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      value: loadingProgress
                                                                  .expectedTotalBytes !=
                                                              null
                                                          ? loadingProgress
                                                                  .cumulativeBytesLoaded /
                                                              loadingProgress
                                                                  .expectedTotalBytes!
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(height: 35, thickness: 1),
                              itemCount: _controller.articles.length,
                            );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
