import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/store_top_preference_entity.g.dart';

@JsonSerializable()
class StoreTopPreferenceEntity {
  const StoreTopPreferenceEntity({
    this.tagId = -1,
    this.name = '',
    this.rank = -1,
  });

  factory StoreTopPreferenceEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreTopPreferenceEntityFromJson(json);
  final int tagId;
  final String name;
  final int rank;
}
