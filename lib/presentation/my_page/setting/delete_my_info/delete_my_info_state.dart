part of 'delete_my_info_view_model.dart';

@freezed
class DeleteMyInfoState with _$DeleteMyInfoState {
  factory DeleteMyInfoState({
    @Default(Status.initial) Status deleteMyInfoStatus,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel deleteMyInfoException,
  }) = _DeleteMyInfoState;
}
