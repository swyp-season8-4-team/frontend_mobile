import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_member_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_model.dart';
import 'package:frontend_mobile/domain/param/mate_member/reject_mate_member_params.dart';
import 'package:frontend_mobile/domain/repository/mate_member_repository.dart';

final Provider<RejectMateMemberUsecase> rejectMateMemberUsecaseProvider =
    Provider<RejectMateMemberUsecase>(
      (Ref ref) => RejectMateMemberUsecase(
        repository: ref.read(mateMemberRepositoryProvider),
      ),
    );

class RejectMateMemberUsecase
    extends Usecase<MateMemberModel, RejectMateMemberParams> {
  RejectMateMemberUsecase({required this.repository});

  final MateMemberRepository repository;

  @override
  Future<Result<MateMemberModel, CustomException>> call({
    required RejectMateMemberParams params,
  }) async {
    return await repository.rejectMateMember(params: params);
  }
}
