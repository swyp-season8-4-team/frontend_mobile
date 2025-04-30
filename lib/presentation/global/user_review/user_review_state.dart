part of 'user_review_view_model.dart';

@freezed
class UserReviewState with _$UserReviewState {
  factory UserReviewState({
    @Default(
      UserReviewModel(reviewCount: 0, reviews: <UserReviewDetailModel>[]),
    )
    UserReviewModel shortReview,
    @Default(Status.loading) Status getMyShortReviewsStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getMyShortReviewsException,
  }) = _UserReviewState;
}
