import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/domain/usecase/mate_reply/get_mate_reply_usecase.dart';

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

  /// 메이트 댓글 전체 조회
  Future<void> getMateReply({required GetMateReplyParams params}) async {
    state = state.copyWith(status: Status.loading);

    final Result<MateReplyModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(getMateReplyUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateReplyModel, CustomException> success) {
        state = state.copyWith(status: Status.success, data: success.data);
      },
      failure: (Failure<MateReplyModel, CustomException> failure) {
        state = state.copyWith(
          status: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
