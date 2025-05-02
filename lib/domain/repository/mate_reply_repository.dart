import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_report_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_report_params.dart';

abstract interface class MateReplyRepository {
  /// [App]메이트 댓글 전체 조회
  Future<Result<MateReplyModel, CustomException>> getMateReply({
    required GetMateReplyParams params,
  });

  /// [App]메이트 댓글 생성
  Future<Result<MateReplyDetailModel, CustomException>> postMateReply({
    required PostMateReplyParams params,
  });

  /// 디저트메이트 댓글 신고
  Future<Result<MateReplyReportModel, CustomException>> postMateReplyReport({
    required PostMateReplyReportParams params,
  });
}
