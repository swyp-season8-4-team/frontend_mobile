import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';

abstract interface class MateReplyRepository {
  /// 메이트 댓글 전체 조회
  Future<Result<MateModel, CustomException>> getMateReply({
    required GetMateParams params,
  });
}
