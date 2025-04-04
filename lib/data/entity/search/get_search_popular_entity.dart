import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_search_popular_entity.g.dart';

//ignore_for_file: library_private_types_in_public_api

@JsonSerializable()
class GetPopularSearchesEntity {
  factory GetPopularSearchesEntity.fromJson(Map<String, dynamic> json) =>
      _$GetPopularSearchesEntityFromJson(json);

  const GetPopularSearchesEntity({
    required this.lastUpdatedTime,
    required this.searches,
  });
  final DateTime lastUpdatedTime;
  final List<_PopularSearch> searches;
}

@JsonSerializable()
class _PopularSearch {
  const _PopularSearch({
    required this.keyword,
    required this.searchCount,
    required this.rank,
    required this.difference,
  });

  factory _PopularSearch.fromJson(Map<String, dynamic> json) =>
      _$PopularSearchFromJson(json);
  final String keyword;
  final int searchCount;
  final int rank;
  final int difference;
}
