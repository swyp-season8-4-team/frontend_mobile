part of 'add_store_review_view_model.dart';

@freezed
class AddStoreReviewState with _$AddStoreReviewState {
  factory AddStoreReviewState({
    @Default(3) int rating,
    @Default('') String content,
    File? image,
    @Default(Status.initial) Status addStoreReviewStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel addStoreReviewException,
  }) = _AddStoreReviewState;

  const AddStoreReviewState._();

  bool get saveButtonEnabled =>
      content.isNotEmpty && !addStoreReviewStatus.isLoading;
}
