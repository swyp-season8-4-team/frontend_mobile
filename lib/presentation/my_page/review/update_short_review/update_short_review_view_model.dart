import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/param/store_review/update_store_review_params.dart';
import 'package:frontend_mobile/domain/usecase/store_review/update_store_review_usecase.dart';

part 'update_short_review_state.dart';
part 'generated/update_short_review_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  UpdateShortReviewViewModel,
  UpdateShortReviewState
>
updateShortReviewViewModelProvider = StateNotifierProvider.autoDispose<
  UpdateShortReviewViewModel,
  UpdateShortReviewState
>((Ref ref) {
  return UpdateShortReviewViewModel(ref: ref);
});

class UpdateShortReviewViewModel extends StateNotifier<UpdateShortReviewState> {
  UpdateShortReviewViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(UpdateShortReviewState());

  final Ref _ref;

  /// 평점 수정
  void updateRating({required int rating}) {
    state = state.copyWith(rating: rating);
  }

  /// 내용 수정
  void updateContent({required String content}) {
    state = state.copyWith(content: content);
  }

  /// 이미지 수정
  void updateImage({File? image}) {
    state = state.copyWith(image: image);
  }

  /// 한줄 리뷰 수정
  Future<void> addStoreReview({
    required String reviewUuid,
    required String storeUuid,
  }) async {
    state = state.copyWith(updateShortReviewStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(updateStoreReviewUsecaseProvider),
      params: UpdateStoreReviewParams(
        storeUuid: storeUuid,
        newImages: state.image != null ? <File>[state.image!] : null,
        reviewUuid: reviewUuid,
        content: state.content,
        rating: state.rating,
      ),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(updateShortReviewStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          updateShortReviewStatus: Status.failure,
          updateShortReviewException: failure.exception.model,
        );
      },
    );
  }
}
