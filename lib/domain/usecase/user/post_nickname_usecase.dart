import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/data/repository_impl/user_repository_impl.dart';
import 'package:frontend_mobile/domain/model/user/nickname_availability_model.dart';
import 'package:frontend_mobile/domain/param/user/post_nickname_params.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<PostNicknameUsecase> postNicknameUsecaseProvider =
    Provider<PostNicknameUsecase>(
      (Ref ref) =>
          PostNicknameUsecase(repository: ref.read(userRepositoryProvider)),
    );

class PostNicknameUsecase
    extends Usecase<NicknameAvailabilityModel, PostNicknameParams> {
  PostNicknameUsecase({required this.repository});

  final UserRepository repository;

  @override
  Future<Result<NicknameAvailabilityModel, CustomException>> call({
    required PostNicknameParams params,
  }) async {
    return await repository.postNickname(params: params);
  }
}
