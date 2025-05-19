import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';
import 'package:frontend_mobile/domain/param/store/get_store_detail_params.dart';
import 'package:frontend_mobile/domain/param/store_review/check_today_review_params.dart';
import 'package:frontend_mobile/domain/param/user/block_user_params.dart';
import 'package:frontend_mobile/domain/usecase/store/get_store_detail_usecase.dart';
import 'package:frontend_mobile/domain/usecase/store_review/check_today_review_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/post_block_user_usecase.dart';

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
          reviewMenuOptionsVisible:
              success.data.storeReviews != null
                  ? success.data.storeReviews!
                      .map(
                        (StoreDetailReviewModel e) => (
                          reviewUuid: e.reviewUuid,
                          isOptionMenuVisible: false,
                        ),
                      )
                      .toList()
                  : <({bool isOptionMenuVisible, String reviewUuid})>[],
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

  /// 사용자 차단하기
  Future<void> blockUser({
    required String blockedUserUuid,
    required String blockedNickname,
  }) async {
    state = state.copyWith(
      blockUserStatus: Status.loading,
      blockedNickname: blockedNickname,
    );

    final Result<BlockedUserModel, CustomException> response =
        await Usecase.execute(
          usecase: _ref.read(postBlockUserUsecaseProvider),
          params: BlockUserParams(blockedUserUuid: blockedUserUuid),
        );

    response.map(
      success: (Success<BlockedUserModel, CustomException> success) {
        state = state.copyWith(blockUserStatus: Status.success);
      },
      failure: (Failure<BlockedUserModel, CustomException> failure) {
        state = state.copyWith(
          blockUserStatus: Status.failure,
          blockUserException: failure.exception.model,
        );
      },
    );
  }

  /// 표시되고 있는 모든 리뷰 옵션 메뉴들을 제거
  void invisibleAllReviewOptionMenu() {
    state = state.copyWith(
      reviewMenuOptionsVisible:
          state.reviewMenuOptionsVisible
              .map(
                (({bool isOptionMenuVisible, String reviewUuid}) e) => (
                  reviewUuid: e.reviewUuid,
                  isOptionMenuVisible: false,
                ),
              )
              .toList(),
    );
  }

  /// 특정 리뷰의 옵션 메뉴 표시 여부 수정
  void updateReviewOptionMenuVisible({
    required String reviewUuid,
    required bool isVisible,
  }) async {
    state = state.copyWith(
      reviewMenuOptionsVisible:
          state.reviewMenuOptionsVisible
              .map(
                (({bool isOptionMenuVisible, String reviewUuid}) e) =>
                    e.reviewUuid == reviewUuid
                        ? (
                          reviewUuid: reviewUuid,
                          isOptionMenuVisible: isVisible,
                        )
                        : e,
              )
              .toList(),
    );
  }
}
