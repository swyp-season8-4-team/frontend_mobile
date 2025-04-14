import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/email/email_verification_request_model.dart';
import 'package:frontend_mobile/domain/model/email/email_verify_model.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';
import 'package:frontend_mobile/domain/usecase/email/post_email_verification_request_usecase.dart';
import 'package:frontend_mobile/domain/usecase/email/post_email_verify_usecase.dart';

part 'find_password_state.dart';
part 'generated/find_password_view_model.freezed.dart';

final AutoDisposeStateNotifierProvider<FindPasswordViewModel, FindPasswordState>
findPasswordViewModelProvider =
    StateNotifierProvider.autoDispose<FindPasswordViewModel, FindPasswordState>(
      (Ref ref) => FindPasswordViewModel(ref: ref),
    );

class FindPasswordViewModel extends StateNotifier<FindPasswordState> {
  FindPasswordViewModel({required this.ref}) : super(const FindPasswordState());

  final Ref ref;

  /// 이메일 인증 코드 발송
  void postVerificationRequest({
    required EmailVerificationRequestParams params,
  }) async {
    state = state.copyWith(
      postVerificationRequestStatus: Status.loading,
      postVerifyStatus: Status.initial,
    );

    final Result<EmailVerificationRequestModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postVerificationRequestUsecaseProvider),
          params: params,
        );

    response.map(
      success: (
        Success<EmailVerificationRequestModel, CustomException> success,
      ) {
        state = state.copyWith(
          postVerificationRequestStatus: Status.success,
          verificationRequestData: success.data,
        );
      },
      failure: (
        Failure<EmailVerificationRequestModel, CustomException> failure,
      ) {
        state = state.copyWith(
          postVerificationRequestStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// 이메일 인증 코드 확인
  void postVerify({required EmailVerifyParams params}) async {
    state = state.copyWith(
      postVerificationRequestStatus: Status.initial,
      postVerifyStatus: Status.loading,
    );

    final Result<EmailVerifyModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postVerifyUsecaseProvider),
          params: params,
        );

    response.map(
      success: (Success<EmailVerifyModel, CustomException> success) {
        state = state.copyWith(
          postVerifyStatus: Status.success,
          verifyData: success.data,
        );
      },
      failure: (Failure<EmailVerifyModel, CustomException> failure) {
        state = state.copyWith(
          postVerifyStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
