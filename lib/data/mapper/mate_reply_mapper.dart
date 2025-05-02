import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_entity.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_report_entity.dart';
import 'package:frontend_mobile/data/query_param/mate_reply/get_mate_reply_query_param.dart';
import 'package:frontend_mobile/data/request_body/mate_reply/post_mate_reply_report_request_body.dart';
import 'package:frontend_mobile/data/request_body/mate_reply/post_mate_reply_request_body.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_report_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_report_params.dart';

extension MateReplyEntityExt on MateReplyEntity {
  MateReplyModel toModel() {
    return MateReplyModel(
      mateUuid: mateUuid,
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
      parentMateReplyId: parentMateReplyId,
      userUuid: userUuid,
      nickname: nickname,
      content: content,
      profileImage: profileImage,
      gender: gender,
      mateMemberGrade: mateMemberGrade,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      children: children.map((MateReplyDetailEntity e) => e.toModel()).toList(),
    );
  }
}

extension GetMateReplyParamsExt on GetMateReplyParams {
  GetMateReplyQueryParam toQuery() {
    return GetMateReplyQueryParam(from: from, to: to);
  }
}

extension PostMateReplyParamsExt on PostMateReplyParams {
  PostMateReplyRequestBody toBody() {
    return PostMateReplyRequestBody(
      userUuid: userUuid,
      content: content,
      parentMateReplyId: parentMateReplyId,
    );
  }
}

extension MateReplyReportEntityExt on MateReplyReportEntity {
  MateReplyReportModel toModel() {
    return MateReplyReportModel(message: message);
  }
}

extension PostMateReplyReportParamsExt on PostMateReplyReportParams {
  PostMateReplyReportRequestBody toBody() {
    return PostMateReplyReportRequestBody(
      userUuid: userUuid,
      reportCategoryId: reportCategoryId,
      reportComment: reportComment,
    );
  }
}
