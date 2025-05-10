import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate/mate_report_model.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_report_params.dart';
import 'package:frontend_mobile/domain/usecase/mate/post_mate_report_usecase.dart';

part 'dessert_post_report_state.dart';
part 'generated/dessert_post_report_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  DessertPostReportViewModel,
  DessertPostReportState
>
dessertPostReportViewModelProvider = StateNotifierProvider.autoDispose(
  (Ref ref) => DessertPostReportViewModel(ref: ref),
);

class DessertPostReportViewModel extends StateNotifier<DessertPostReportState> {
  DessertPostReportViewModel({required this.ref})
    : super(const DessertPostReportState());

  final Ref ref;

  /// 디저트메이트 신고 기능
  Future<void> postMateReport({required PostMateReportParams params}) async {
    state = state.copyWith(status: Status.loading);

    final Result<MateReportModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postMateReportUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateReportModel, CustomException> success) {
        state = state.copyWith(status: Status.success);
      },
      failure: (Failure<MateReportModel, CustomException> failure) {
        state = state.copyWith(
          status: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
