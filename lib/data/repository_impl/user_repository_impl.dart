import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/user_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/user/blocked_user_list_entity.dart';
import 'package:frontend_mobile/data/entity/user/nickname_availability_entity.dart';
import 'package:frontend_mobile/data/entity/user/user_detail_entity.dart';
import 'package:frontend_mobile/data/entity/user/user_review_entity.dart';
import 'package:frontend_mobile/data/mapper/user_mapper.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_list_model.dart';
import 'package:frontend_mobile/domain/model/user/nickname_availability_model.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/domain/param/user/post_nickname_params.dart';
import 'package:frontend_mobile/domain/param/user/unblock_user_params.dart';
import 'package:frontend_mobile/domain/param/user/update_profile_image_params.dart';
import 'package:frontend_mobile/domain/repository/user_repository.dart';

final Provider<UserRepository> userRepositoryProvider =
    Provider<UserRepository>(
      (Ref ref) => UserRepositoryImpl(api: ref.read(userApiProvider)),
    );

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required this.api});

  final UserRemoteDataSource api;

  @override
  Future<Result<NicknameAvailabilityModel, CustomException>> postNickname({
    required PostNicknameParams params,
  }) async {
    return await apiCall(
      api: () async {
        final NicknameAvailabilityEntity result = await api.postNickname(
          body: params.toBody(),
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<UserDetailModel, CustomException>> getMe() async {
    return await apiCall(
      api: () async {
        final UserDetailEntity result = await api.getMe();

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<UserDetailModel, CustomException>> patchMe({
    required PatchMeParams params,
  }) async {
    return await apiCall(
      api: () async {
        final UserDetailEntity result = await api.patchMe(
          body: params.toBody(),
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<void, CustomException>> updateProfileImage({
    required UpdateProfileImageParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await api.updateProfileImage(image: params.image);
      },
    );
  }

  @override
  Future<Result<void, CustomException>> deleteMe({
    required NoParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await api.deleteMe();
      },
    );
  }

  @override
  Future<Result<UserReviewModel, CustomException>> getNyReviews({
    required NoParams params,
  }) async {
    return await apiCall(
      api: () async {
        final UserReviewEntity result = await api.getMyReviews();
        return result.toModel();
      },
    );
  }

  @override
  Future<Result<BlockedUserListModel, CustomException>> getBlockedUsers({
    required NoParams params,
  }) async {
    return await apiCall(
      api: () async {
        final BlockedUserListEntity result = await api.getBlockedUsers();
        return result.toModel();
      },
    );
  }

  @override
  Future<Result<void, CustomException>> unblockUser({
    required UnblockUserParams params,
  }) async {
    return await apiCall(
      api: () async {
        return await api.unblockUser(blockId: params.blockId);
      },
    );
  }
}
