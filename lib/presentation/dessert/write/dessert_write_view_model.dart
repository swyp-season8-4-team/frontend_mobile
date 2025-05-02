import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_params.dart';
import 'package:frontend_mobile/domain/usecase/mate/post_mate_usecase.dart';
import 'package:frontend_mobile/presentation/dessert/dessert_board_view_model.dart';

part 'dessert_write_state.dart';
part 'generated/dessert_write_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<DessertWriteViewModel, DessertWriteState>
dessertWriteViewModelProvider = StateNotifierProvider.autoDispose(
  (Ref ref) => DessertWriteViewModel(ref: ref),
);

class DessertWriteViewModel extends StateNotifier<DessertWriteState> {
  DessertWriteViewModel({required this.ref}) : super(const DessertWriteState());

  final Ref ref;

  /// 메이트 생성
  Future<void> postMate({required PostMateParams params}) async {
    state = state.copyWith(status: Status.loading);

    final Result<MateDetailModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postMateUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateDetailModel, CustomException> success) {
        ref
            .read(dessertBoardViewModelProvider.notifier)
            .modifyData(item: success.data);

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
