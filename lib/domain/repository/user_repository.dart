import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';

abstract interface class UserRepository {
  /// 현재 사용자 정보 조회
  Future<Result<UserDetailModel, CustomException>> getMe();

  /// 사용자 정보 수정
  Future<Result<UserDetailModel, CustomException>> patchMe({
    required PatchMeParams params,
  });
}
