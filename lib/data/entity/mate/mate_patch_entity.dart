import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_patch_entity.g.dart';

@JsonSerializable()
class MatePatchEntity {
  MatePatchEntity({this.message = ''});

  factory MatePatchEntity.fromJson(Map<String, dynamic> json) =>
      _$MatePatchEntityFromJson(json);

  final String message;
}
