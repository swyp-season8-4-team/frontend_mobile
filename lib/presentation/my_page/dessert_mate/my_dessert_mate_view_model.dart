import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_my_mate_params.dart';
import 'package:frontend_mobile/domain/usecase/mate/get_my_mate_usecase.dart';

part 'my_dessert_mate_state.dart';
part 'generated/my_dessert_mate_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<
  MyDessertMateViewModel,
  MyDessertMateState
>
myDessertMateViewModelProvider = StateNotifierProvider.autoDispose<
  MyDessertMateViewModel,
  MyDessertMateState
>((Ref ref) {
  return MyDessertMateViewModel(ref: ref);
});

class MyDessertMateViewModel extends StateNotifier<MyDessertMateState> {
  MyDessertMateViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(MyDessertMateState());

  final Ref _ref;

  /// 내가 참여한 메이트 조회
  // TODO: 페이지 네이션 구현 필요
  Future<void> getMate() async {
    state = state.copyWith(getMyMateStatus: Status.loading);

    final Result<MateModel, CustomException> response = await Usecase.execute(
      usecase: _ref.read(getMyMateUsecaseProvider),
      params: const GetMyMateParams(),
    );

    response.map(
      success: (Success<MateModel, CustomException> success) {
        state = state.copyWith(
          getMyMateStatus: Status.success,
          data: success.data,
        );
      },
      failure: (Failure<MateModel, CustomException> failure) {
        state = state.copyWith(
          getMyMateStatus: Status.failure,
          getMyMateException: failure.exception.model,
        );
      },
    );
  }
}
