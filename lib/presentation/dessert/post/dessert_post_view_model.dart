import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/usecase/mate/get_mate_detail_usecase.dart';

part 'dessert_post_state.dart';
part 'generated/dessert_post_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<DessertPostViewModel, DessertPostState>
dessertPostViewModelProvider = StateNotifierProvider.autoDispose(
  (Ref ref) => DessertPostViewModel(ref: ref),
);

class DessertPostViewModel extends StateNotifier<DessertPostState> {
  DessertPostViewModel({required this.ref}) : super(const DessertPostState());

  final Ref ref;

  /// 메이트 상세 정보 조회
  Future<void> getMateDetail({required GetMateDetailParams params}) async {
    state = state.copyWith(status: Status.loading);

    final Result<MateDetailModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(getMateDetailUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateDetailModel, CustomException> success) {
        state = state.copyWith(status: Status.success, data: success.data);
      },
      failure: (Failure<MateDetailModel, CustomException> failure) {
        state = state.copyWith(
          status: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
