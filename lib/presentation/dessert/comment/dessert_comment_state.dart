part of 'dessert_comment_view_model.dart';

@freezed
class DessertCommentState with _$DessertCommentState {
  const factory DessertCommentState({
    @Default(Status.initial) Status getMateReplyStatus,
    @Default(Status.initial) Status postMateReplyStatus,
    @Default(Status.initial) Status postMateReplyReportStatus,
    @Default(Status.initial) Status postBlockUserStatus,
    @Default('') String blockedUserNickname,
    @Default(
      MateReplyModel(
        mateUuid: '',
        mateReplies: <MateReplyDetailModel>[],
        count: -1,
        last: false,
      ),
    )
    MateReplyModel data,
    @Default(ExceptionModel(status: -1, code: '', message: '', timestamp: ''))
    ExceptionModel exception,
  }) = _DessertCommentState;
}
