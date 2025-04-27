import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_reply_detail_entity.g.dart';

@JsonSerializable()
class MateReplyDetailEntity {
  MateReplyDetailEntity({
    this.mateReplyId = -1,
    this.parentMateReplyId,
    this.userUuid = '',
    this.nickname = '',
    this.content = '',
    this.profileImage = '',
    this.gender = '',
    this.createdAt = '',
    this.updatedAt,
    this.deletedAt,
    this.children = const <MateReplyDetailEntity>[],
  });

  factory MateReplyDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$MateReplyDetailEntityFromJson(json);

  final int mateReplyId;
  final int? parentMateReplyId;
  final String userUuid;
  final String nickname;
  final String content;
  final String profileImage;
  final String gender;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<MateReplyDetailEntity> children;
}
