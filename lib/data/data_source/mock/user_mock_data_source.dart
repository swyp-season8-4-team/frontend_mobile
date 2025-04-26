import 'dart:io';

import 'package:frontend_mobile/data/data_source/remote/user_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/user/nickname_availability_entity.dart';
import 'package:frontend_mobile/data/entity/user/user_detail_entity.dart';
import 'package:frontend_mobile/data/request_body/user/patch_me_request_body.dart';
import 'package:frontend_mobile/data/request_body/user/post_nickname_request_body.dart';

class UserMockDataSource implements UserRemoteDataSource {
  @override
  Future<UserDetailEntity> getMe() async {
    return const UserDetailEntity(
      nickname: '유저 닉네임 1',
      name: '유저 네임 1',
      preferences: <int>[1, 2, 3, 4, 5, 6, 7, 9, 10],
      email: 'email@email.com',
    );
  }

  @override
  Future<UserDetailEntity> patchMe({required PatchMeRequestBody body}) {
    // TODO: implement patchMe
    throw UnimplementedError();
  }

  @override
  Future<NicknameAvailabilityEntity> postNickname({
    required PostNicknameRequestBody body,
  }) {
    // TODO: implement postNickname
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfileImage({required File image}) {
    // TODO: implement updateProfileImage
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMe() {
    // TODO: implement deleteMe
    throw UnimplementedError();
  }
}
