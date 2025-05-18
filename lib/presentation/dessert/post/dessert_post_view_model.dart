import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_model.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/accept_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/ban_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/delete_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/get_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/leave_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/pending_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/post_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/reject_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/user/block_user_params.dart';
import 'package:frontend_mobile/domain/usecase/mate/get_mate_detail_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/accept_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/ban_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/delete_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/get_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/leave_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/pending_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/post_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/reject_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/post_block_user_usecase.dart';
import 'package:frontend_mobile/presentation/dessert/dessert_board_view_model.dart';

part 'dessert_post_state.dart';
part 'generated/dessert_post_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<DessertPostViewModel, DessertPostState>
dessertPostViewModelProvider = StateNotifierProvider.autoDispose(
  (Ref ref) => DessertPostViewModel(ref: ref),
);

class DessertPostViewModel extends StateNotifier<DessertPostState> {
  DessertPostViewModel({required this.ref}) : super(const DessertPostState());

  final Ref ref;

  /// 메이트 상세 정보 조회
  Future<void> getMateDetail({required GetMateDetailParams params}) async {
    state = state.copyWith(mateDetailStatus: Status.loading);

    final Result<MateDetailModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(getMateDetailUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateDetailModel, CustomException> success) {
        state = state.copyWith(
          mateDetailStatus: Status.success,
          data: success.data,
        );
      },
      failure: (Failure<MateDetailModel, CustomException> failure) {
        state = state.copyWith(
          mateDetailStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트 메이트 멤버 신청
  Future<void> postMateMember({required PostMateMemberParams params}) async {
    state = state.copyWith(
      postMateStatus: Status.loading,
      deleteMateStatus: Status.initial,
      leaveMateStatus: Status.initial,
      pendingMateStatus: Status.initial,
      acceptMateStatus: Status.initial,
      rejectMateStatus: Status.initial,
      getMateStatus: Status.initial,
      banMateStatus: Status.initial,
    );

    final Result<MateMemberModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateMemberModel, CustomException> success) {
        state = state.copyWith(
          postMateStatus: Status.success,
          data: state.data.copyWith(applyStatus: 'PENDING'),
        );
      },
      failure: (Failure<MateMemberModel, CustomException> failure) {
        state = state.copyWith(
          postMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트 메이트 멤버 신청 취소
  Future<void> deleteMateMember({
    required DeleteMateMemberParams params,
  }) async {
    state = state.copyWith(
      deleteMateStatus: Status.loading,
      postMateStatus: Status.initial,
      leaveMateStatus: Status.initial,
      pendingMateStatus: Status.initial,
      acceptMateStatus: Status.initial,
      rejectMateStatus: Status.initial,
      getMateStatus: Status.initial,
      banMateStatus: Status.initial,
    );

    final Result<MateMemberModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(deleteMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateMemberModel, CustomException> success) {
        state = state.copyWith(
          deleteMateStatus: Status.success,
          data: state.data.copyWith(applyStatus: 'NONE'),
        );
      },
      failure: (Failure<MateMemberModel, CustomException> failure) {
        state = state.copyWith(
          deleteMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트 메이트 멤버 신청 탈퇴
  Future<void> leaveMateMember({required LeaveMateMemberParams params}) async {
    state = state.copyWith(
      leaveMateStatus: Status.loading,
      deleteMateStatus: Status.initial,
      postMateStatus: Status.initial,
      pendingMateStatus: Status.initial,
      acceptMateStatus: Status.initial,
      rejectMateStatus: Status.initial,
      getMateStatus: Status.initial,
      banMateStatus: Status.initial,
    );

    final Result<MateMemberModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(leaveMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateMemberModel, CustomException> success) {
        state = state.copyWith(
          leaveMateStatus: Status.success,
          data: state.data.copyWith(applyStatus: 'NONE'),
        );
      },
      failure: (Failure<MateMemberModel, CustomException> failure) {
        state = state.copyWith(
          leaveMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트 메이트 대기 멤버 전체 조회
  Future<void> pendingMateMember({
    required PendingMateMemberParams params,
  }) async {
    state = state.copyWith(
      pendingMateStatus: Status.loading,
      leaveMateStatus: Status.initial,
      deleteMateStatus: Status.initial,
      postMateStatus: Status.initial,
      acceptMateStatus: Status.initial,
      rejectMateStatus: Status.initial,
      getMateStatus: Status.initial,
      banMateStatus: Status.initial,
    );

    final Result<List<MateMemberDetailModel>, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(pendingMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<List<MateMemberDetailModel>, CustomException> success) {
        state = state.copyWith(
          pendingMateStatus: Status.success,
          pendingData: success.data,
        );
      },
      failure: (Failure<List<MateMemberDetailModel>, CustomException> failure) {
        state = state.copyWith(
          pendingMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트 메이트 대기 신청 수락
  Future<void> acceptMateMember({
    required AcceptMateMemberParams params,
  }) async {
    state = state.copyWith(
      acceptMateStatus: Status.loading,
      pendingMateStatus: Status.initial,
      leaveMateStatus: Status.initial,
      deleteMateStatus: Status.initial,
      postMateStatus: Status.initial,
      rejectMateStatus: Status.initial,
      getMateStatus: Status.initial,
      banMateStatus: Status.initial,
    );

    final Result<MateMemberModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(acceptMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateMemberModel, CustomException> success) {
        getMateDetail(params: GetMateDetailParams(mateUuid: params.mateUuid));
        pendingMateMember(
          params: PendingMateMemberParams(mateUuid: params.mateUuid),
        );
        getMateMember(params: GetMateMemberParams(mateUuid: params.mateUuid));

        state = state.copyWith(acceptMateStatus: Status.success);
      },
      failure: (Failure<MateMemberModel, CustomException> failure) {
        state = state.copyWith(
          acceptMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트 메이트 멤버 신청 거절
  Future<void> rejectMateMember({
    required RejectMateMemberParams params,
  }) async {
    state = state.copyWith(
      rejectMateStatus: Status.loading,
      acceptMateStatus: Status.initial,
      pendingMateStatus: Status.initial,
      leaveMateStatus: Status.initial,
      deleteMateStatus: Status.initial,
      postMateStatus: Status.initial,
      getMateStatus: Status.initial,
      banMateStatus: Status.initial,
    );

    final Result<MateMemberModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(rejectMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateMemberModel, CustomException> success) {
        getMateDetail(params: GetMateDetailParams(mateUuid: params.mateUuid));
        pendingMateMember(
          params: PendingMateMemberParams(mateUuid: params.mateUuid),
        );

        state = state.copyWith(rejectMateStatus: Status.success);
      },
      failure: (Failure<MateMemberModel, CustomException> failure) {
        state = state.copyWith(
          rejectMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트 메이트 멤버 전체 조회
  Future<void> getMateMember({required GetMateMemberParams params}) async {
    state = state.copyWith(
      getMateStatus: Status.loading,
      pendingMateStatus: Status.initial,
      leaveMateStatus: Status.initial,
      deleteMateStatus: Status.initial,
      postMateStatus: Status.initial,
      acceptMateStatus: Status.initial,
      rejectMateStatus: Status.initial,
      banMateStatus: Status.initial,
    );

    final Result<List<MateMemberDetailModel>, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(getMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<List<MateMemberDetailModel>, CustomException> success) {
        state = state.copyWith(
          pendingMateStatus: Status.success,
          memberData: success.data,
        );
      },
      failure: (Failure<List<MateMemberDetailModel>, CustomException> failure) {
        state = state.copyWith(
          pendingMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트 메이트 멤버 신청 강퇴
  Future<void> banMateMember({required BanMateMemberParams params}) async {
    state = state.copyWith(
      banMateStatus: Status.loading,
      rejectMateStatus: Status.initial,
      acceptMateStatus: Status.initial,
      pendingMateStatus: Status.initial,
      leaveMateStatus: Status.initial,
      deleteMateStatus: Status.initial,
      postMateStatus: Status.initial,
      getMateStatus: Status.initial,
    );

    final Result<MateMemberModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(banMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateMemberModel, CustomException> success) {
        getMateDetail(params: GetMateDetailParams(mateUuid: params.mateUuid));
        getMateMember(params: GetMateMemberParams(mateUuid: params.mateUuid));

        state = state.copyWith(banMateStatus: Status.success);
      },
      failure: (Failure<MateMemberModel, CustomException> failure) {
        state = state.copyWith(
          banMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 사용자 차단하기
  Future<void> postBlockUser({required BlockUserParams params}) async {
    state = state.copyWith(postBlockUserStatus: Status.loading);

    final Result<BlockedUserModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postBlockUserUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<BlockedUserModel, CustomException> success) {
        final DessertBoardViewModel notifier = ref.read(
          dessertBoardViewModelProvider.notifier,
        );

        notifier.updateMateBlockData(
          blockedUserUuid: success.data.blockedUserUuid,
          blockedUserNickname: success.data.blockedUserNickname,
        );

        state = state.copyWith(postBlockUserStatus: Status.success);
      },
      failure: (Failure<BlockedUserModel, CustomException> failure) {
        state = state.copyWith(
          postBlockUserStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
