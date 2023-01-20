import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? desc;

  @JsonKey(name: 'urlToImage')
  String? imageUrl;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: 'publishedAt')
  String? publishedAt;

  Article();

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  // DateTime? get getPublishedAtDate => DateTime.tryParse(publishedAt);
}
