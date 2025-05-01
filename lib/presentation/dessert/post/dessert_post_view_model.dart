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
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/accept_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/delete_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/leave_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/pending_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/post_mate_member_params.dart';
import 'package:frontend_mobile/domain/usecase/mate/get_mate_detail_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/accept_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/delete_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/leave_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/pending_mate_member_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_member/post_mate_member_usecase.dart';

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
    );

    final Result<MateMemberModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(acceptMateMemberUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateMemberModel, CustomException> success) {
        final List<MateMemberDetailModel> pendingData =
            state.pendingData
                .where(
                  (MateMemberDetailModel element) =>
                      element.userUuid != params.acceptUserUuid,
                )
                .toList();

        state = state.copyWith(
          acceptMateStatus: Status.success,
          pendingData: pendingData,
        );

        getMateDetail(params: GetMateDetailParams(mateUuid: params.mateUuid));
      },
      failure: (Failure<MateMemberModel, CustomException> failure) {
        state = state.copyWith(
          acceptMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
