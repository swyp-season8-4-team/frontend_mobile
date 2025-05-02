import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_member_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate_member/pending_mate_member_params.dart';
import 'package:frontend_mobile/domain/repository/mate_member_repository.dart';

final Provider<PendingMateMemberUsecase> pendingMateMemberUsecaseProvider =
    Provider<PendingMateMemberUsecase>(
      (Ref ref) => PendingMateMemberUsecase(
        repository: ref.read(mateMemberRepositoryProvider),
      ),
    );

class PendingMateMemberUsecase
    extends Usecase<List<MateMemberDetailModel>, PendingMateMemberParams> {
  PendingMateMemberUsecase({required this.repository});

  final MateMemberRepository repository;

  @override
  Future<Result<List<MateMemberDetailModel>, CustomException>> call({
    required PendingMateMemberParams params,
  }) async {
    return await repository.getPendingMateMember(params: params);
  }
}
