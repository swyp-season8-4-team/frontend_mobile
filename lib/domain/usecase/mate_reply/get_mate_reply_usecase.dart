import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_reply_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/domain/repository/mate_reply_repository.dart';

final Provider<GetMateReplyUsecase> getMateReplyUsecaseProvider =
    Provider<GetMateReplyUsecase>(
      (Ref ref) => GetMateReplyUsecase(
        repository: ref.read(mateReplyRepositoryProvider),
      ),
    );

class GetMateReplyUsecase extends Usecase<MateReplyModel, GetMateReplyParams> {
  GetMateReplyUsecase({required this.repository});

  final MateReplyRepository repository;

  @override
  Future<Result<MateReplyModel, CustomException>> call({
    required GetMateReplyParams params,
  }) async {
    return await repository.getMateReply(params: params);
  }
}
