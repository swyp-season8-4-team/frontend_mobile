import 'package:frontend_mobile/data/entity/mate_member/mate_member_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate_member/mate_member_entity.dart';
import 'package:frontend_mobile/data/request_body/mate_member/accept_mate_member_request_body.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_model.dart';
import 'package:frontend_mobile/domain/param/mate_member/accept_mate_member_params.dart';

extension MateMemberEntityExt on MateMemberEntity {
  MateMemberModel toModel() {
    return MateMemberModel(message: message);
  }
}

extension MateMemberDetailEntityExt on MateMemberDetailEntity {
  MateMemberDetailModel toModel() {
    return MateMemberDetailModel(
      userId: userId,
      userUuid: userUuid,
      grade: grade,
      profileImage: profileImage,
      nickname: nickname,
      applyStatus: applyStatus,
      gender: gender,
    );
  }
}

extension AcceptMateMemberParamsExt on AcceptMateMemberParams {
  AcceptMateMemberRequestBody toBody() {
    return AcceptMateMemberRequestBody(
      creatorUserUuid: creatorUserUuid,
      acceptUserUuid: acceptUserUuid,
    );
  }
}
