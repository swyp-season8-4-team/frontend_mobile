part of 'dessert_post_report_view_model.dart';

@freezed
class DessertPostReportState with _$DessertPostReportState {
  const factory DessertPostReportState({
    @Default(Status.initial) Status status,
    MateReportModel? data,
    ExceptionModel? exception,
  }) = _DessertPostReportState;
}
