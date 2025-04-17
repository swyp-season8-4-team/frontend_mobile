import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/store_notice/store_notice_model.dart';
import 'package:frontend_mobile/domain/param/store_notice/get_store_notices_params.dart';
import 'package:frontend_mobile/domain/usecase/store_notice/get_store_notices_usecase.dart';

part 'store_notice_state.dart';
part 'generated/store_notice_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<StoreNoticeViewModel, StoreNoticeState>
storeNoticeViewModelProvider =
    StateNotifierProvider.autoDispose<StoreNoticeViewModel, StoreNoticeState>((
      Ref ref,
    ) {
      return StoreNoticeViewModel(ref: ref);
    });

class StoreNoticeViewModel extends StateNotifier<StoreNoticeState> {
  StoreNoticeViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(StoreNoticeState());

  final Ref _ref;

  Future<StoreNoticeState> getNotices({required String storeUuid}) async {
    state = state.copyWith(getStoreNoticesStatus: Status.loading);

    final Result<List<StoreNoticeModel>, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getStoreNoticesUsecaseProvider),
          params: GetStoreNoticesParams(storeUuid: storeUuid),
        );

    result.map(
      success: (Success<List<StoreNoticeModel>, CustomException> success) {
        state = state.copyWith(
          getStoreNoticesStatus: Status.success,
          storeNotices: success.data,
        );
      },
      failure: (Failure<List<StoreNoticeModel>, CustomException> failure) {
        state = state.copyWith(
          getStoreNoticesStatus: Status.failure,
          getStoreNoticesException: failure.exception.model,
        );
      },
    );

    return state;
  }
}
