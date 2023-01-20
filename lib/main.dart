import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx/features/news_headline/binding/newsh_headline_binding.dart';
import 'package:news_app_getx/features/news_headline/news_headline_view.dart';
import 'package:news_app_getx/features/search_news/binding/search_news_binding.dart';
import 'features/search_news/view/search_news_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/news_headline',
      getPages: [
        GetPage(
          name: '/news_headline',
          page: () => NewsHeadlineView(),
          binding: NewsHeadlineBinding(),
        ),
        GetPage(
          name: '/search_news',
          page: () => SearchNewsView(),
          binding: SearchNewsBinding(),
        ),
      ],
    );
  }
}
