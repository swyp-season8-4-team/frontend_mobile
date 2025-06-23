import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/resource/usecase.dart';
import 'package:frontend_mobile/domain/model/oauth/apple_model.dart';
import 'package:frontend_mobile/domain/model/oauth/kakao_model.dart';
import 'package:frontend_mobile/domain/param/oauth/apple_params.dart';
import 'package:frontend_mobile/domain/param/oauth/kakao_params.dart';
import 'package:frontend_mobile/domain/usecase/oauth/post_apple_login_usecase.dart';
import 'package:frontend_mobile/domain/usecase/oauth/post_kakao_login_usecase.dart';

part 'generated/oauth_view_model.freezed.dart';
part 'oauth_state.dart';

final AutoDisposeStateNotifierProvider<OauthViewModel, OauthState>
oauthViewModelProvider =
    StateNotifierProvider.autoDispose<OauthViewModel, OauthState>(
      (Ref ref) => OauthViewModel(ref: ref),
    );

class OauthViewModel extends StateNotifier<OauthState> {
  OauthViewModel({required this.ref}) : super(const OauthState());

  final Ref ref;

  /// OAuth 회원가입, 로그인
  void kakaoLogin({required KakaoParams params}) async {
    state = state.copyWith(
      kakaoStatus: Status.loading,
      appleStatus: Status.initial,
    );

    final Result<KakaoModel, CustomException> response = await Usecase.execute(
      usecase: ref.read(postKakaoLoginUsecaseProvider),
      params: params,
    );

    response.map(
      success: (Success<KakaoModel, CustomException> success) {
        state = state.copyWith(
          kakaoStatus: Status.success,
          kakaoData: success.data,
        );
      },
      failure: (Failure<KakaoModel, CustomException> failure) {
        state = state.copyWith(
          kakaoStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }

  /// Apple 회원가입, 로그인
  void appleLogin({required AppleParams params}) async {
    state = state.copyWith(
      appleStatus: Status.loading,
      kakaoStatus: Status.initial,
    );

    final Result<AppleModel, CustomException> response = await Usecase.execute(
      usecase: ref.read(postAppleLoginUsecaseProvider),
      params: params,
    );

    response.map(
      success: (Success<AppleModel, CustomException> success) {
        state = state.copyWith(
          appleStatus: Status.success,
          appleData: success.data,
        );
      },
      failure: (Failure<AppleModel, CustomException> failure) {
        state = state.copyWith(
          appleStatus: Status.failure,
          exception: failure.exception.model,
        );
      },
    );
  }
}
