import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/enum.dart';
import 'package:frontend_mobile/core/resource/result/result.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/domain/model/auth/local_login_model.dart';
import 'package:frontend_mobile/domain/usecase/auth/base/auth_usecase.dart';
import 'package:frontend_mobile/domain/usecase/auth/post_dev_local_login_usecase.dart';

part 'local_login_state.dart';
part 'local_login_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<LocalLoginViewModel, LocalLoginState>
localLoginViewModelProvider =
    StateNotifierProvider.autoDispose<LocalLoginViewModel, LocalLoginState>(
      (Ref ref) => LocalLoginViewModel(usecase: ref.read(authUsecaseProvider)),
    );

class LocalLoginViewModel extends StateNotifier<LocalLoginState> {
  LocalLoginViewModel({required this.usecase}) : super(const LocalLoginState());

  final AuthUsecase usecase;

  /// [Dev 로그인(presentation)](https://api.desserbee.com/swagger-ui/index.html#/Authentication/devlogin)
  void postDevLocalLogin({required LocalLoginRequestBody body}) async {
    state = state.copyWith(status: Status.loading);

    await Future<void>.delayed(const Duration(seconds: 2));

    final Result<LocalLoginModel> response = await usecase
        .execute<LocalLoginModel>(
          usecase: PostDevLocalLoginUsecase(body: body),
        );

    response.when(
      success: (LocalLoginModel data) {
        state = state.copyWith(
          status: Status.success,
          code: Code.C003,
          data: data,
        );
      },
      failure: (String message) {
        state = state.copyWith(
          status: Status.failure,
          code: Code.C001,
          message: message,
        );
      },
    );
  }
}
