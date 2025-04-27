import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'dart:io';

import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/param/store_review/add_store_review_params.dart';
import 'package:frontend_mobile/domain/usecase/store_review/add_store_review_usecase.dart';

part 'generated/add_store_review_view_model.freezed.dart';
part 'add_store_review_state.dart';

final AutoDisposeStateNotifierProvider<
  AddStoreReviewViewModel,
  AddStoreReviewState
>
addStoreReviewViewModelProvider = StateNotifierProvider.autoDispose<
  AddStoreReviewViewModel,
  AddStoreReviewState
>((Ref ref) {
  return AddStoreReviewViewModel(ref: ref);
});

class AddStoreReviewViewModel extends StateNotifier<AddStoreReviewState> {
  AddStoreReviewViewModel({required Ref ref})
    : _ref = ref,
      super(AddStoreReviewState());

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

  /// 리뷰 작성
  Future<void> addStoreReview({
    required String userUuid,
    required String storeUuid,
  }) async {
    state = state.copyWith(addStoreReviewStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(addStoreReviewUsecaseProvider),
      params: AddStoreReviewParams(
        storeUuid: storeUuid,
        images: state.image != null ? <File>[state.image!] : null,
        userUuid: userUuid,
        content: state.content,
        rating: state.rating,
      ),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(addStoreReviewStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          addStoreReviewStatus: Status.failure,
          addStoreReviewException: failure.exception.model,
        );
      },
    );
  }
}
