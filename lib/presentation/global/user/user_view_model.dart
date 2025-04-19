import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/params/no_params.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/domain/usecase/user/get_me_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/patch_me_usecase.dart';

part 'generated/user_view_model.freezed.dart';
part 'user_state.dart';

/// 유저 정보는 앱 전역적으로 사용하기 때문에 autoDispose 적용 X
final StateNotifierProvider<UserViewModel, UserState> userViewModelProvider =
    StateNotifierProvider<UserViewModel, UserState>(
      (Ref ref) => UserViewModel(ref: ref),
    );

class UserViewModel extends StateNotifier<UserState> {
  UserViewModel({required this.ref}) : super(const UserState());

  final Ref ref;

  /// 현재 사용자 정보 조회
  void getMe() async {
    state = state.copyWith(status: Status.loading);

    final Result<UserDetailModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(getMeUsecaseProvider),
          params: NoParams(),
        );

    response.map(
      success: (Success<UserDetailModel, CustomException> success) {
        state = state.copyWith(status: Status.success, data: success.data);
      },
      failure: (Failure<UserDetailModel, CustomException> failure) {
        state = state.copyWith(
          status: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 사용자 정보 수정
  void patchMe({required PatchMeParams params}) async {
    state = state.copyWith(status: Status.loading);

    final Result<UserDetailModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(patchMeUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<UserDetailModel, CustomException> success) {
        state = state.copyWith(status: Status.success, data: success.data);
      },
      failure: (Failure<UserDetailModel, CustomException> failure) {
        state = state.copyWith(
          status: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
