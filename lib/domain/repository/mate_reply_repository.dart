import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';

abstract interface class MateReplyRepository {
  /// 메이트 댓글 전체 조회
  Future<Result<MateReplyModel, CustomException>> getMateReply({
    required GetMateReplyParams params,
  });
}
