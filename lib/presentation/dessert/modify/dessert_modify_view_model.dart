import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate/mate_delete_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_patch_model.dart';
import 'package:frontend_mobile/domain/param/mate/delete_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/patch_mate_params.dart';
import 'package:frontend_mobile/domain/usecase/mate/delete_mate_usecase.dart';
import 'package:frontend_mobile/domain/usecase/mate/patch_mate_usecase.dart';
import 'package:frontend_mobile/presentation/dessert/dessert_board_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';

part 'dessert_modify_state.dart';
part 'generated/dessert_modify_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  DessertModifyViewModel,
  DessertModifyState
>
dessertModifyViewModelProvider = StateNotifierProvider.autoDispose(
  (Ref ref) => DessertModifyViewModel(ref: ref),
);

class DessertModifyViewModel extends StateNotifier<DessertModifyState> {
  DessertModifyViewModel({required this.ref})
    : super(const DessertModifyState());

  final Ref ref;

  /// 메이트 수정
  Future<void> patchMate({required PatchMateParams params}) async {
    state = state.copyWith(
      patchMateStatus: Status.loading,
      deleteMateStatus: Status.initial,
    );

    final Result<MatePatchModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(patchMateUsecaseProvider),
          params: params,
        );

    await response.map(
      success: (Success<MatePatchModel, CustomException> success) async {
        await ref
            .read(dessertBoardViewModelProvider.notifier)
            .getMate(params: GetMateParams(to: 1000));

        final DessertPostState postState = ref.read(
          dessertPostViewModelProvider,
        );

        await ref
            .read(dessertPostViewModelProvider.notifier)
            .getMateDetail(
              params: GetMateDetailParams(mateUuid: postState.data.mateUuid),
            );

        state = state.copyWith(patchMateStatus: Status.success);
      },
      failure: (Failure<MatePatchModel, CustomException> failure) {
        state = state.copyWith(
          patchMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 메이트 삭제
  Future<void> deleteMate({required DeleteMateParams params}) async {
    state = state.copyWith(
      deleteMateStatus: Status.loading,
      patchMateStatus: Status.initial,
    );

    final Result<MateDeleteModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(deleteMateUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<MateDeleteModel, CustomException> success) {
        state = state.copyWith(deleteMateStatus: Status.success);
      },
      failure: (Failure<MateDeleteModel, CustomException> failure) {
        state = state.copyWith(
          deleteMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
