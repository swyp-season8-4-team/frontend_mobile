import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/user/user_review_model.dart';
import 'package:frontend_mobile/domain/usecase/user/get_my_reviews_usecase.dart';

part 'generated/my_page_view_model.freezed.dart';
part 'my_page_state.dart';

final AutoDisposeStateNotifierProvider<MyPageViewModel, MyPageState>
myPageViewModelProvider =
    StateNotifierProvider.autoDispose<MyPageViewModel, MyPageState>((Ref ref) {
      return MyPageViewModel(ref: ref);
    });

class MyPageViewModel extends StateNotifier<MyPageState> {
  MyPageViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(MyPageState());

  final Ref _ref;

  /// 내가 작성한 한줄 리뷰 조회
  Future<void> getMyReviews() async {
    state = state.copyWith(getMyReviewsStatus: Status.loading);

    final Result<UserReviewModel, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getMyReviewsUsecaseProvider),
          params: NoParams(),
        );

    result.map(
      success: (Success<UserReviewModel, CustomException> success) {
        state = state.copyWith(
          getMyReviewsStatus: Status.success,
          review: success.data,
        );
      },
      failure: (Failure<UserReviewModel, CustomException> failure) {
        state = state.copyWith(
          getMyReviewsStatus: Status.failure,
          getMyReviewsException: failure.exception.model,
        );
      },
    );
  }
}
