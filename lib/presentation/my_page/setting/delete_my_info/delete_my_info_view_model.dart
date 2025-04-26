import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/delete_me_usecase.dart';

part 'generated/delete_my_info_view_model.freezed.dart';
part 'delete_my_info_state.dart';

final AutoDisposeStateNotifierProvider<DeleteMyInfoViewModel, DeleteMyInfoState>
deleteMyInfoViewModelProvider =
    StateNotifierProvider.autoDispose<DeleteMyInfoViewModel, DeleteMyInfoState>(
      (Ref ref) {
        return DeleteMyInfoViewModel(ref: ref);
      },
    );

class DeleteMyInfoViewModel extends StateNotifier<DeleteMyInfoState> {
  DeleteMyInfoViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(DeleteMyInfoState());

  final Ref _ref;

  /// 회원 탈퇴
  Future<void> deleteMyInfo() async {
    state = state.copyWith(deleteMyInfoStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(deleteMeUsecaseProvider),
      params: NoParams(),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(deleteMyInfoStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          deleteMyInfoStatus: Status.failure,
          deleteMyInfoException: failure.exception.model,
        );
      },
    );
  }
}
