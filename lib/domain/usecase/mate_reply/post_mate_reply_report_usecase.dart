import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_reply_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_report_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_report_params.dart';
import 'package:frontend_mobile/domain/repository/mate_reply_repository.dart';

final Provider<PostMateReplyReportUsecase> postMateReplyReportUsecaseProvider =
    Provider<PostMateReplyReportUsecase>(
      (Ref ref) => PostMateReplyReportUsecase(
        repository: ref.read(mateReplyRepositoryProvider),
      ),
    );

class PostMateReplyReportUsecase
    extends Usecase<MateReplyReportModel, PostMateReplyReportParams> {
  PostMateReplyReportUsecase({required this.repository});

  final MateReplyRepository repository;

  @override
  Future<Result<MateReplyReportModel, CustomException>> call({
    required PostMateReplyReportParams params,
  }) async {
    return await repository.postMateReplyReport(params: params);
  }
}
