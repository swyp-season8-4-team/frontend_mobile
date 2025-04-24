import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/param/user_store/get_user_store_list_all_params.dart';
import 'package:frontend_mobile/domain/usecase/user_store/get_user_store_list_all_usecase.dart';

part 'my_page_state.dart';
part 'generated/my_page_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<MyPageViewModel, MyPageState>
myPageViewModelProvider =
    StateNotifierProvider.autoDispose<MyPageViewModel, MyPageState>((Ref ref) {
      return MyPageViewModel(ref: ref);
    });

class MyPageViewModel extends StateNotifier<MyPageState> {
  MyPageViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(MyPageState());

  final Ref _ref;

  /// 저장 리스트 전체 조회
  Future<void> getUserStoreListAll({required String userUuid}) async {
    state = state.copyWith(getUserStoreListAllStatus: Status.loading);

    final Result<List<UserStoreListModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getUserStoreListAllUsecaseProvider),
          params: GetUserStoreListAllParams(userUuid: userUuid),
        );

    result.map(
      success: (Success<List<UserStoreListModel>, CustomException> success) {
        state = state.copyWith(
          getUserStoreListAllStatus: Status.success,
          userStoreLists: success.data,
        );
      },
      failure: (Failure<List<UserStoreListModel>, CustomException> failure) {
        state = state.copyWith(
          getUserStoreListAllStatus: Status.failure,
          getUserStoreListAllException: failure.exception.model,
        );
      },
    );
  }
}
