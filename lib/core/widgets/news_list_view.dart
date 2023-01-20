import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsListView extends StatelessWidget {
  final _controller;

  const NewsListView({
    super.key,
    required GetxController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _controller.articles[index].title.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              _controller.articles[index].desc.toString(),
            ),
            const SizedBox(height: 6),
            _controller.articles[index].imageUrl == null
                ? const SizedBox.shrink()
                : Image.network(
                    _controller.articles[index].imageUrl!,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
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
  }
}
