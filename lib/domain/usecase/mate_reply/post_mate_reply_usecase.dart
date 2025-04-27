import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_reply_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_params.dart';
import 'package:frontend_mobile/domain/repository/mate_reply_repository.dart';

final Provider<PostMateReplyUsecase> postMateReplyUsecaseProvider =
    Provider<PostMateReplyUsecase>(
      (Ref ref) => PostMateReplyUsecase(
        repository: ref.read(mateReplyRepositoryProvider),
      ),
    );

class PostMateReplyUsecase
    extends Usecase<MateReplyDetailModel, PostMateReplyParams> {
  PostMateReplyUsecase({required this.repository});

  final MateReplyRepository repository;

  @override
  Future<Result<MateReplyDetailModel, CustomException>> call({
    required PostMateReplyParams params,
  }) async {
    return await repository.postMateReply(params: params);
  }
}
