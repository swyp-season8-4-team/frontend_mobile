import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_entity.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_model.dart';

extension MateReplyEntityExt on MateReplyEntity {
  MateReplyModel toModel() {
    return MateReplyModel(
      mateReplies:
          mateReplies.map((MateReplyDetailEntity e) => e.toModel()).toList(),
      count: count,
      last: last,
    );
  }
}

extension MateReplyDetailEntityExt on MateReplyDetailEntity {
  MateReplyDetailModel toModel() {
    return MateReplyDetailModel(
      mateReplyId: mateReplyId,
      mateUuid: mateUuid,
      parentMateReplyId: parentMateReplyId,
      userUuid: userUuid,
      nickname: nickname,
      content: content,
      profileImage: profileImage,
      gender: gender,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
