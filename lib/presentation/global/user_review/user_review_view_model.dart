import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:frontend_mobile/domain/param/store_review/delete_store_review_params.dart';
import 'package:frontend_mobile/domain/usecase/store_review/delete_store_review_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/get_my_reviews_usecase.dart';

part 'generated/user_review_view_model.freezed.dart';
part 'user_review_state.dart';

final StateNotifierProvider<UserReviewViewModel, UserReviewState>
userReviewViewModelProvider =
    StateNotifierProvider<UserReviewViewModel, UserReviewState>((Ref ref) {
      return UserReviewViewModel(ref: ref);
    });

class UserReviewViewModel extends StateNotifier<UserReviewState> {
  UserReviewViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(UserReviewState());

  final Ref _ref;

  /// 내가 작성한 한줄 리뷰 조회
  Future<void> getMyShortReviews() async {
    state = state.copyWith(getMyShortReviewsStatus: Status.loading);

    final Result<UserReviewModel, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getMyReviewsUsecaseProvider),
          params: NoParams(),
        );

    result.map(
      success: (Success<UserReviewModel, CustomException> success) {
        state = state.copyWith(
          getMyShortReviewsStatus: Status.success,
          shortReview: success.data,
        );
      },
      failure: (Failure<UserReviewModel, CustomException> failure) {
        state = state.copyWith(
          getMyShortReviewsStatus: Status.failure,
          getMyShortReviewsException: failure.exception.model,
        );
      },
    );
  }

  /// 내가 작성한 한줄 리뷰 삭제
  Future<void> deleteMyShortReview({
    required String storeUuid,
    required String reviewUuid,
  }) async {
    state = state.copyWith(deleteMyShortReviewStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(deleteStoreReviewUsecaseProvider),
      params: DeleteStoreReviewParams(
        storeUuid: storeUuid,
        reviewUuid: reviewUuid,
      ),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(deleteMyShortReviewStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          deleteMyShortReviewStatus: Status.failure,
          deleteMyShortReviewException: failure.exception.model,
        );
      },
    );
  }
}
