import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/param/user_store/add_user_store_list_params.dart';
import 'package:frontend_mobile/domain/usecase/user_store/add_user_store_list_usecase.dart';

part 'add_user_store_list_state.dart';

part 'generated/add_user_store_list_view_model.freezed.dart';

class AddUserStoreListViewModel extends StateNotifier<AddUserStoreListState> {
  AddUserStoreListViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(AddUserStoreListState());

  final Ref _ref;

  void updateListName({required String listName}) {
    state = state.copyWith(listName: listName);
  }

  void updateIconColorId({required int iconColorId}) {
    state = state.copyWith(iconColorId: iconColorId);
  }

  // 저장 리스트 생성
  Future<AddUserStoreListState> addUserStoreList({
    required String userUuid,
  }) async {
    state = state.copyWith(addUserStoreListStatus: Status.loading);

    final Result<void, CustomException> result = await Usecase.execute(
      usecase: _ref.read(addUserStoreListUsecaseProvider),
      params: AddUserStoreListParams(
        listName: state.listName!,
        iconColorId: state.iconColorId,
        userUuid: userUuid,
      ),
    );

    result.map(
      success: (Success<void, CustomException> success) {
        state = state.copyWith(addUserStoreListStatus: Status.success);
      },
      failure: (Failure<void, CustomException> failure) {
        state = state.copyWith(
          addUserStoreListStatus: Status.failure,
          addUserStoreListException: failure.exception.model,
        );
      },
    );

    return state;
  }
}
