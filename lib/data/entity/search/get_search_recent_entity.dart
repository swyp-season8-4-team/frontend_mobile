import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_search_recent_entity.g.dart';

@JsonSerializable()
class GetSearchRecentEntity {
  const GetSearchRecentEntity({
    required this.id,
    required this.keyword,
    required this.createdAt,
  });

  factory GetSearchRecentEntity.fromJson(Map<String, dynamic> json) =>
      _$GetSearchRecentEntityFromJson(json);

  final int id;
  final String keyword;
  final DateTime createdAt;
}
