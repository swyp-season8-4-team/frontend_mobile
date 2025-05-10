import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate/mate_report_model.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_report_params.dart';
import 'package:frontend_mobile/domain/repository/mate_repository.dart';

final Provider<PostMateReportUsecase> postMateReportUsecaseProvider =
    Provider<PostMateReportUsecase>(
      (Ref ref) =>
          PostMateReportUsecase(repository: ref.read(mateRepositoryProvider)),
    );

class PostMateReportUsecase
    extends Usecase<MateReportModel, PostMateReportParams> {
  PostMateReportUsecase({required this.repository});

  final MateRepository repository;

  @override
  Future<Result<MateReportModel, CustomException>> call({
    required PostMateReportParams params,
  }) async {
    return await repository.postMateReport(params: params);
  }
}
