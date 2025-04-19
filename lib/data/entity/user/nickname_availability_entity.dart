import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/nickname_availability_entity.g.dart';

@JsonSerializable()
class NicknameAvailabilityEntity {
  const NicknameAvailabilityEntity({this.available = false});

  factory NicknameAvailabilityEntity.fromJson(Map<String, dynamic> json) =>
      _$NicknameAvailabilityEntityFromJson(json);

  final bool available;
}
