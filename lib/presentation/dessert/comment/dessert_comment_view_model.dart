import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_report_model.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_report_params.dart';
import 'package:frontend_mobile/domain/param/user/block_user_params.dart';
import 'package:frontend_mobile/domain/usecase/mate_reply/get_mate_reply_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_reply/post_mate_reply_report_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate_reply/post_mate_reply_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/post_block_user_usecase.dart';

part 'dessert_comment_state.dart';
part 'generated/dessert_comment_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  DessertCommentViewModel,
  DessertCommentState
>
dessertCommentViewModelProvider = StateNotifierProvider.autoDispose(
  (Ref ref) => DessertCommentViewModel(ref: ref),
);

class DessertCommentViewModel extends StateNotifier<DessertCommentState> {
  DessertCommentViewModel({required this.ref})
    : super(const DessertCommentState());

  final Ref ref;

  /// [App]메이트 댓글 전체 조회
  Future<void> getMateReply({required GetMateReplyParams params}) async {
    state = state.copyWith(getMateReplyStatus: Status.loading);

    final Result<MateReplyModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(getMateReplyUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateReplyModel, CustomException> success) {
        state = state.copyWith(
          getMateReplyStatus: Status.success,
          data: success.data,
        );
      },
      failure: (Failure<MateReplyModel, CustomException> failure) {
        state = state.copyWith(
          getMateReplyStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// [App]메이트 댓글 생성
  Future<void> postMateReply({required PostMateReplyParams params}) async {
    state = state.copyWith(postMateReplyStatus: Status.loading);

    final Result<MateReplyDetailModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postMateReplyUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateReplyDetailModel, CustomException> success) {
        getMateReply(params: GetMateReplyParams(mateUuid: params.mateUuid));

        state = state.copyWith(postMateReplyStatus: Status.success);
      },
      failure: (Failure<MateReplyDetailModel, CustomException> failure) {
        state = state.copyWith(
          postMateReplyStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 디저트메이트 댓글 신고
  Future<void> postMateReplyReport({
    required PostMateReplyReportParams params,
  }) async {
    state = state.copyWith(postMateReplyReportStatus: Status.loading);

    final Result<MateReplyReportModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postMateReplyReportUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateReplyReportModel, CustomException> success) {
        state = state.copyWith(postMateReplyReportStatus: Status.success);
      },
      failure: (Failure<MateReplyReportModel, CustomException> failure) {
        state = state.copyWith(
          postMateReplyReportStatus: Status.failure,
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
        state = state.copyWith(
          postBlockUserStatus: Status.success,
          blockedUserNickname: success.data.blockedUserNickname,
        );
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
