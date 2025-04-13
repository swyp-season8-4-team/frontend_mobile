import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_search_popular_query_param.g.dart';

@JsonSerializable()
class GetSearchPopularQueryParam {
  const GetSearchPopularQueryParam({this.limit});
  final int? limit;

  Map<String, dynamic> toJson() => _$GetSearchPopularQueryParamToJson(this);
}
