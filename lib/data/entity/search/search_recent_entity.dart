import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/util/json_converter.dart';

part 'generated/search_recent_entity.g.dart';

@JsonSerializable()
class RecentSearchEntity {
  const RecentSearchEntity({
    required this.createdAt,
    this.id = -1,
    this.keyword = '',
  });

  factory RecentSearchEntity.fromJson(Map<String, dynamic> json) =>
      _$RecentSearchEntityFromJson(json);

  final int id;
  final String keyword;
  @DateTimeJsonConverter()
  final DateTime createdAt;
}
