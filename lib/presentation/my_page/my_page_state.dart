part of 'my_page_view_model.dart';

@freezed
class MyPageState with _$MyPageState {
  factory MyPageState({
    @Default(
      UserReviewModel(reviewCount: 0, reviews: <UserReviewDetailModel>[]),
    )
    UserReviewModel review,
    @Default(Status.loading) Status getMyReviewsStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel getMyReviewsException,
  }) = _MyPageState;
}
