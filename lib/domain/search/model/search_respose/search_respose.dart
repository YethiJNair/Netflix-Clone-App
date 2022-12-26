import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/constants.dart';

part 'search_respose.g.dart';

@JsonSerializable()
class SearchRespose {
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchRespose({
    this.results = const [],
  });

  factory SearchRespose.fromJson(Map<String, dynamic> json) {
    return _$SearchResposeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResposeToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterImageUrl => '$imageAppendUrl$posterPath';

  SearchResultData({
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
