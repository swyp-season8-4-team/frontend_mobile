import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_member_detail_entity.g.dart';

@JsonSerializable()
class MateMemberDetailEntity {
  MateMemberDetailEntity({
    this.userId = -1,
    this.userUuid = '',
    this.grade = '',
    this.profileImage = '',
    this.nickname = '',
    this.applyStatus = '',
    this.gender = '',
  });

  factory MateMemberDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$MateMemberDetailEntityFromJson(json);

  final int userId;
  final String userUuid;
  final String grade;
  final String profileImage;
  final String nickname;
  final String applyStatus;
  final String gender;
}
