import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_member_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate_member/get_mate_member_params.dart';
import 'package:frontend_mobile/domain/repository/mate_member_repository.dart';

final Provider<GetMateMemberUsecase> getMateMemberUsecaseProvider =
    Provider<GetMateMemberUsecase>(
      (Ref ref) => GetMateMemberUsecase(
        repository: ref.read(mateMemberRepositoryProvider),
      ),
    );

class GetMateMemberUsecase
    extends Usecase<List<MateMemberDetailModel>, GetMateMemberParams> {
  GetMateMemberUsecase({required this.repository});

  final MateMemberRepository repository;

  @override
  Future<Result<List<MateMemberDetailModel>, CustomException>> call({
    required GetMateMemberParams params,
  }) async {
    return await repository.getMateMember(params: params);
  }
}
