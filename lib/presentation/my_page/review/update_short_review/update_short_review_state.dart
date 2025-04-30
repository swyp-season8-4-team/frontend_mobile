part of 'update_short_review_view_model.dart';

@freezed
class UpdateShortReviewState with _$UpdateShortReviewState {
  factory UpdateShortReviewState({
    @Default(3) int rating,
    @Default('') String content,
    File? image,
    @Default(Status.initial) Status updateShortReviewStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel updateShortReviewException,
  }) = _UpdateShortReviewState;

  const UpdateShortReviewState._();

  bool get updateButtonEnabled =>
      content.isNotEmpty && !updateShortReviewStatus.isLoading;
}
