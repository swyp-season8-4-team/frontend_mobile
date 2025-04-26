import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_detail_entity.dart';

part 'generated/mate_reply_entity.g.dart';

@JsonSerializable()
class MateReplyEntity {
  MateReplyEntity({
    this.mateReplies = const <MateReplyDetailEntity>[],
    this.count = -1,
    this.last = false,
  });

  factory MateReplyEntity.fromJson(Map<String, dynamic> json) =>
      _$MateReplyEntityFromJson(json);

  final List<MateReplyDetailEntity> mateReplies;
  final int count;
  final bool last;
}
