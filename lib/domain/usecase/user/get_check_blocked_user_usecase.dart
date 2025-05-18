import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_repository_impl.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';
import 'package:frontend_mobile/domain/param/user/block_user_params.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<GetCheckBlockedUserUsecase> getCheckBlockedUserUsecaseProvider =
    Provider<GetCheckBlockedUserUsecase>((Ref ref) {
      return GetCheckBlockedUserUsecase(
        repository: ref.read(userRepositoryProvider),
      );
    });

class GetCheckBlockedUserUsecase
    implements Usecase<BlockedUserModel, BlockUserParams> {
  const GetCheckBlockedUserUsecase({required UserRepository repository})
    : _repository = repository;
  final UserRepository _repository;

  @override
  Future<Result<BlockedUserModel, CustomException>> call({
    required BlockUserParams params,
  }) async {
    return await _repository.getCheckBlockedUser(params: params);
  }
}
