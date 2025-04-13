import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/email/email_verification_request_model.dart';
import 'package:frontend_mobile/domain/model/email/email_verify_model.dart';
import 'package:frontend_mobile/domain/model/user/nickname_availability_model.dart';
import 'package:frontend_mobile/domain/param/email/email_verification_request_params.dart';
import 'package:frontend_mobile/domain/param/email/email_verify_params.dart';
import 'package:frontend_mobile/domain/param/user/post_nickname_params.dart';
import 'package:frontend_mobile/domain/usecase/email/post_email_verification_request_usecase.dart';
import 'package:frontend_mobile/domain/usecase/email/post_email_verify_usecase.dart';
import 'package:frontend_mobile/domain/usecase/user/post_nickname_usecase.dart';

part 'generated/sign_up_view_model.freezed.dart';
part 'sign_up_state.dart';

final AutoDisposeStateNotifierProvider<SignUpViewModel, SignUpState>
signUpViewModelProvider = StateNotifierProvider.autoDispose(
  (Ref ref) => SignUpViewModel(ref: ref),
);

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel({required this.ref}) : super(const SignUpState());

  final Ref ref;

  /// 닉네임 중복 검사
  void postNickname({required PostNicknameParams params}) async {
    state = state.copyWith(postNicknameStatus: Status.loading);

    final Result<NicknameAvailabilityModel, CustomException> response =
        await Usecase.execute(
          usecase: ref.read(postNicknameUsecaseProvider),
          params: PostNicknameParams(
            nickname: params.nickname,
            purpose: params.purpose,
          ),
        );

    response.map(
      success: (Success<NicknameAvailabilityModel, CustomException> success) {
        state = state.copyWith(
          postNicknameStatus: Status.success,
          nicknameAvailabilityData: success.data,
        );
      },
      failure: (Failure<NicknameAvailabilityModel, CustomException> failure) {
        state = state.copyWith(
          postNicknameStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

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
