import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/mate_member_repository_impl.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_model.dart';
import 'package:frontend_mobile/domain/param/mate_member/ban_mate_member_params.dart';
import 'package:frontend_mobile/domain/repository/mate_member_repository.dart';

final Provider<BanMateMemberUsecase> banMateMemberUsecaseProvider =
    Provider<BanMateMemberUsecase>(
      (Ref ref) => BanMateMemberUsecase(
        repository: ref.read(mateMemberRepositoryProvider),
      ),
    );

class BanMateMemberUsecase
    extends Usecase<MateMemberModel, BanMateMemberParams> {
  BanMateMemberUsecase({required this.repository});

  final MateMemberRepository repository;

  @override
  Future<Result<MateMemberModel, CustomException>> call({
    required BanMateMemberParams params,
  }) async {
    return await repository.banMateMember(params: params);
  }
}
