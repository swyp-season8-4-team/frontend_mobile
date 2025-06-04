import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';
import 'package:frontend_mobile/domain/usecase/mate/get_mate_usecase.dart';

part 'dessert_board_state.dart';
part 'generated/dessert_board_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<DessertBoardViewModel, DessertBoardState>
dessertBoardViewModelProvider =
    StateNotifierProvider.autoDispose<DessertBoardViewModel, DessertBoardState>(
      (Ref ref) => DessertBoardViewModel(ref: ref),
    );

class DessertBoardViewModel extends StateNotifier<DessertBoardState> {
  DessertBoardViewModel({required this.ref}) : super(const DessertBoardState());

  final Ref ref;

  /// 메이트 전체 조회
  Future<void> getMate({required GetMateParams params}) async {
    state = state.copyWith(
      getMateStatus: Status.loading,
      updateMateBlockDataStatus: Status.initial,
    );

    final Result<MateModel, CustomException> response = await Usecase.execute(
      usecase: ref.read(getMateUsecaseProvider),
      params: params,
    );

    response.map(
      success: (Success<MateModel, CustomException> success) {
        state = state.copyWith(
          getMateStatus: Status.success,
          data: success.data,
          backupData:
              state.backupData.mates.isEmpty ? success.data : state.backupData,
        );
      },
      failure: (Failure<MateModel, CustomException> failure) {
        state = state.copyWith(
          getMateStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  void updateMateBlockData({
    required String blockedUserUuid,
    required String blockedUserNickname,
  }) {
    final List<MateDetailModel> newMates =
        state.data.mates
            .where(
              (MateDetailModel element) => element.userUuid != blockedUserUuid,
            )
            .toList();

    final List<MateDetailModel> newBackupMates =
        state.backupData.mates
            .where(
              (MateDetailModel element) => element.userUuid != blockedUserUuid,
            )
            .toList();

    state = state.copyWith(
      updateMateBlockDataStatus: Status.success,
      blockedUserNickname: blockedUserNickname,
      data: state.data.copyWith(mates: newMates),
      backupData: state.data.copyWith(mates: newBackupMates),
    );
  }

  void modifyData({required MateDetailModel item}) {
    final List<MateDetailModel> newBackupMates = <MateDetailModel>[
      item,
      ...state.backupData.mates,
    ];

    /// 글쓰기 카테고리가 현재 선택한 카테고리 리스트와 같은 경우
    List<MateDetailModel> newDataMates = state.data.mates;
    if (state.data.mates[0].mateCategory == item.mateCategory) {
      newDataMates = <MateDetailModel>[item, ...state.data.mates];
    }

    state = state.copyWith(
      data: state.data.copyWith(mates: newDataMates),
      backupData: state.backupData.copyWith(mates: newBackupMates),
    );
  }

  void removeData({required String mateUuid}) {
    final List<MateDetailModel> newDataMates =
        state.data.mates
            .where((MateDetailModel element) => element.mateUuid != mateUuid)
            .toList();

    state = state.copyWith(
      backupData: state.backupData.copyWith(mates: newDataMates),
    );
  }
}
