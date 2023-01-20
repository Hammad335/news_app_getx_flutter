// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article()
  ..author = json['author'] as String?
  ..title = json['title'] as String?
  ..desc = json['description'] as String?
  ..imageUrl = json['urlToImage'] as String?
  ..url = json['url'] as String?
  ..content = json['content'] as String?
  ..publishedAt = json['publishedAt'] as String?;

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.desc,
      'urlToImage': instance.imageUrl,
      'url': instance.url,
      'content': instance.content,
      'publishedAt': instance.publishedAt,
    };
