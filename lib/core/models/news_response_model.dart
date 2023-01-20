import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_getx/core/models/article.dart';
part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel {
  @JsonKey(name: 'status')
  late String status;

  @JsonKey(name: 'totalResults')
  late int totalResults;

  @JsonKey(name: 'articles')
  late List<Article> articles;

  NewsResponseModel();

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseModelToJson(this);
}
