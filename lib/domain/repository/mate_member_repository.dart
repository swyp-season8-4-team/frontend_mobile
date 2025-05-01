import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_model.dart';
import 'package:frontend_mobile/domain/param/mate_member/accept_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/delete_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/leave_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/pending_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/post_mate_member_params.dart';

abstract interface class MateMemberRepository {
  /// 디저트 메이트 멤버 신청
  Future<Result<MateMemberModel, CustomException>> postMateMember({
    required PostMateMemberParams params,
  });

  /// 디저트 메이트 멤버 신청 취소
  Future<Result<MateMemberModel, CustomException>> deleteMateMember({
    required DeleteMateMemberParams params,
  });

  /// 디저트 메이트 멤버 신청 탈퇴
  Future<Result<MateMemberModel, CustomException>> leaveMateMember({
    required LeaveMateMemberParams params,
  });

  /// 디저트 메이트 대기 멤버 전체 조회
  Future<Result<List<MateMemberDetailModel>, CustomException>>
  getPendingMateMember({required PendingMateMemberParams params});

  /// 디저트 메이트 대기 멤버 전체 조회
  Future<Result<MateMemberModel, CustomException>> acceptMateMember({
    required AcceptMateMemberParams params,
  });
}
