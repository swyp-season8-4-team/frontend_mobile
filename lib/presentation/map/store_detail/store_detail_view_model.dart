import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/domain/param/store/get_store_detail_params.dart';
import 'package:frontend_mobile/domain/param/store_review/check_today_review_params.dart';
import 'package:frontend_mobile/domain/usecase/store/get_store_detail_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store_review/check_today_review_usecase.dart';

part 'store_detail_state.dart';
part 'generated/store_detail_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<StoreDetailViewModel, StoreDetailState>
storeDetailViewModelProvider =
    StateNotifierProvider.autoDispose<StoreDetailViewModel, StoreDetailState>((
      Ref ref,
    ) {
      return StoreDetailViewModel(ref: ref);
    });

class StoreDetailViewModel extends StateNotifier<StoreDetailState> {
  StoreDetailViewModel({required Ref<Object?> ref})
    : _ref = ref,
      super(StoreDetailState());

  final Ref _ref;

  /// 가게 상세 정보 조회
  Future<StoreDetailState> getStoreDetail({required String storeUuid}) async {
    state = state.copyWith(getStoreDetailStatus: Status.loading);

    final Result<StoreDetailModel, CustomException> result =
        await Usecase.execute(
          usecase: _ref.read(getStoreDetailUsecaseProvider),
          params: GetStoreDetailParams(storeUuid: storeUuid),
        );

    result.map(
      success: (Success<StoreDetailModel, CustomException> success) {
        state = state.copyWith(
          getStoreDetailStatus: Status.success,
          storeDetail: success.data,
        );
      },
      failure: (Failure<StoreDetailModel, CustomException> failure) {
        state = state.copyWith(
          getStoreDetailStatus: Status.failure,
          getStoreDetailException: failure.exception.model,
        );
      },
    );

    return state;
  }

  /// 오늘 작성한 리뷰 여부 조회
  Future<void> checkTodayReview({
    required String storeUuid,
    required String userUuid,
  }) async {
    state = state.copyWith(checkTodayReviewStatus: Status.loading);

    final Result<bool, CustomException> result = await Usecase.execute(
      usecase: _ref.read(checkTodayReviewUsecaseProvider),
      params: CheckTodayReviewParams(storeUuid: storeUuid, userUuid: userUuid),
    );

    result.map(
      success: (Success<bool, CustomException> success) {
        state = state.copyWith(
          checkTodayReviewStatus: Status.success,
          todayReviewExist: success.data,
        );
      },
      failure: (Failure<bool, CustomException> failure) {
        state = state.copyWith(
          checkTodayReviewStatus: Status.failure,
          checkTodayReviewException: failure.exception.model,
        );
      },
    );
  }
}
