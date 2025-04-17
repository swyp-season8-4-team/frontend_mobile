import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/search_popular_entity.g.dart';

//ignore_for_file: library_private_types_in_public_api

@JsonSerializable()
class PopularSearchesEntity {
  factory PopularSearchesEntity.fromJson(Map<String, dynamic> json) =>
      _$PopularSearchesEntityFromJson(json);

  const PopularSearchesEntity({required this.lastUpdatedTime, this.searches});
  final DateTime lastUpdatedTime;
  final List<PopularSearch>? searches;
}

@JsonSerializable()
class PopularSearch {
  const PopularSearch({
    required this.keyword,
    required this.searchCount,
    required this.rank,
    required this.difference,
  });

  factory PopularSearch.fromJson(Map<String, dynamic> json) =>
      _$PopularSearchFromJson(json);
  final String keyword;
  final int searchCount;
  final int rank;
  final int difference;
}
