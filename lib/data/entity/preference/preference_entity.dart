import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/preference_entity.g.dart';

@JsonSerializable()
class PreferenceEntity {
  const PreferenceEntity({
    required this.id,
    required this.preferenceName,
    required this.preferenceDesc,
  });

  factory PreferenceEntity.fromJson(Map<String, dynamic> json) =>
      _$PreferenceEntityFromJson(json);

  final int id;
  final String preferenceName;
  final String preferenceDesc;
}
