import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_search_popular_entity.g.dart';

@JsonSerializable()
class GetSearchPopularEntity {
  factory GetSearchPopularEntity.fromJson(Map<String, dynamic> json) =>
      _$GetSearchPopularEntityFromJson(json);

  const GetSearchPopularEntity({
    required this.keyword,
    required this.searchCount,
    required this.rank,
    required this.difference,
  });
  final String keyword;
  final int searchCount;
  final int rank;
  final int difference;
}
