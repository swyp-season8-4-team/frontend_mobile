import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/domain/usecase/auth/post_dev_local_login_usecase.dart';
import 'package:frontend_mobile/domain/usecase/auth/post_local_login_usecase.dart';

part 'generated/local_login_view_model.freezed.dart';
part 'local_login_state.dart';

final AutoDisposeStateNotifierProvider<LocalLoginViewModel, LocalLoginState>
localLoginViewModelProvider =
    StateNotifierProvider.autoDispose<LocalLoginViewModel, LocalLoginState>(
      (Ref ref) => LocalLoginViewModel(ref: ref),
    );

class LocalLoginViewModel extends StateNotifier<LocalLoginState> {
  LocalLoginViewModel({required this.ref}) : super(const LocalLoginState());

  final Ref ref;

  /// Dev 로그인(presentation)
  Future<void> postDevLocalLogin({required LocalLoginParams params}) async {
    state = state.copyWith(status: Status.loading);

    final Result<LocalLoginModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postDevLocalLoginUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<LocalLoginModel, CustomException> success) {
        state = state.copyWith(status: Status.success, data: success.data);
      },
      failure: (Failure<LocalLoginModel, CustomException> failure) {
        state = state.copyWith(
          status: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 로그인(presentation)
  Future<void> postLocalLogin({required LocalLoginParams params}) async {
    state = state.copyWith(status: Status.loading);

    final Result<LocalLoginModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postLocalLoginUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<LocalLoginModel, CustomException> success) {
        state = state.copyWith(status: Status.success, data: success.data);
      },
      failure: (Failure<LocalLoginModel, CustomException> failure) {
        state = state.copyWith(
          status: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
