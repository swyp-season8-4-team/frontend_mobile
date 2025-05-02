import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_member_entity.g.dart';

@JsonSerializable()
class MateMemberEntity {
  MateMemberEntity({this.message = ''});

  factory MateMemberEntity.fromJson(Map<String, dynamic> json) =>
      _$MateMemberEntityFromJson(json);

  final String message;
}
