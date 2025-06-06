import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_delete_entity.g.dart';

@JsonSerializable()
class MateDeleteEntity {
  MateDeleteEntity({this.message = ''});

  factory MateDeleteEntity.fromJson(Map<String, dynamic> json) =>
      _$MateDeleteEntityFromJson(json);

  final String message;
}
