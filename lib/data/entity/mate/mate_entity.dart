import 'package:frontend_mobile/data/entity/mate/mate_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generated/mate_entity.g.dart';

@JsonSerializable()
class MateEntity {
  MateEntity({this.mates = const <MateDetailEntity>[], this.last = false});

  factory MateEntity.fromJson(Map<String, dynamic> json) =>
      _$MateEntityFromJson(json);

  final List<MateDetailEntity> mates;
  final bool last;
}
