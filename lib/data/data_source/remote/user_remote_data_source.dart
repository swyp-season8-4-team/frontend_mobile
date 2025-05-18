import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/user/blocked_user_entity.dart';
import 'package:frontend_mobile/data/entity/user/blocked_user_list_entity.dart';
import 'package:frontend_mobile/data/entity/user/nickname_availability_entity.dart';
import 'package:frontend_mobile/data/entity/user/user_detail_entity.dart';
import 'package:frontend_mobile/data/entity/user/user_review_entity.dart';
import 'package:frontend_mobile/data/request_body/user/block_user_request_body.dart';
import 'package:frontend_mobile/data/request_body/user/patch_me_request_body.dart';
import 'package:frontend_mobile/data/request_body/user/post_nickname_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/user_remote_data_source.g.dart';

final Provider<UserRemoteDataSource> userApiProvider =
    Provider<UserRemoteDataSource>((Ref ref) {
      final Dio dio = ref.read(appDioProvider);
      return UserRemoteDataSource(dio);
    });

@RestApi()
abstract interface class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio, {String? baseUrl}) =
      _UserRemoteDataSource;

  /// 닉네임 중복 검사
  @POST('/api/users/validate/nickname')
  Future<NicknameAvailabilityEntity> postNickname({
    @Body() required PostNicknameRequestBody body,
  });

  /// 현재 사용자 정보 조회
  @GET('/api/users/me')
  Future<UserDetailEntity> getMe();

  /// 사용자 정보 수정
  @PATCH('/api/users/me')
  Future<UserDetailEntity> patchMe({@Body() required PatchMeRequestBody body});

  /// 프로필 이미지 수정
  @POST('/api/users/me/profile-image')
  @MultiPart()
  Future<void> updateProfileImage({
    @Part(name: 'image', contentType: 'image/png') required File image,
  });

  /// 회원 탈퇴
  @DELETE('/api/users/me')
  Future<void> deleteMe();

  /// 내가 작성한 한줄 리뷰 조회
  @GET('/api/users/me/reviews/short')
  Future<UserReviewEntity> getMyReviews();

  /// 차단된 사용자 목록 조회
  @GET('/api/users/blocks')
  Future<BlockedUserListEntity> getBlockedUsers();

  /// 사용자 차단하기
  @POST('/api/users/blocks')
  Future<BlockedUserEntity> postBlockUser({
    @Body() required BlockUserRequestBody body,
  });

  /// 차단 여부 확인
  @POST('/api/users/blocks/check/{blockedUserUuid}')
  Future<BlockedUserEntity> getCheckBlockedUser({
    @Path() required String blockedUserUuid,
  });

  /// 특정 사용자 차단 해제
  @DELETE('/api/users/blocks/{blockId}')
  Future<void> unblockUser({@Path('blockId') required int blockId});
}
