import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/presentation/global/login/login_view_model.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class LocalLoginView extends ConsumerStatefulWidget {
  const LocalLoginView({super.key});

  @override
  ConsumerState<LocalLoginView> createState() => _LocalLoginViewState();
}

class _LocalLoginViewState extends ConsumerState<LocalLoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _emailError = false;
  String _emailErrorText = '';

  /// 비밀번호 에러를 실시간 기준으로 할지 api 통신 기준으로 할지 결정하는 변수
  /// null: 에러 설정 X
  /// true: 실시간 에러 기준
  /// false: api 통신 에러 기준
  bool? isRealTimePasswordError;

  /// 실시간 입력과 관련된 비밀번호
  bool _realTimePasswordError = false;
  final String _realTimePasswordErrorText = '비밀번호를 다시 입력해주세요';

  /// api 통신와 관련된 비밀번호
  bool _passwordError = false;
  String _passwordErrorText = '';

  final bool _keepLoggedIn = false;
  bool _visibility = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailRender);
    _passwordController.addListener(_onPasswordRender);
  }

  void _onEmailRender() {
    setState(() {});
  }

  void _onPasswordRender() {
    isRealTimePasswordError = true;

    if (_passwordController.text.isNotEmpty &&
        !_passwordController.text.isPasswordValid) {
      setState(() {
        _realTimePasswordError = true;
      });
    } else {
      setState(() {
        _realTimePasswordError = false;
      });
    }
  }

  void _onSubmit() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (!email.isEmail) {
      setState(() {
        _emailError = true;
        _passwordError = false;
      });
      return;
    }

    if (_passwordController.text.length < 8) {
      setState(() {
        _emailError = false;
        _passwordError = true;
      });
      return;
    }

    setState(() {
      _emailError = false;
      _passwordError = false;
    });

    ref
        .read(localLoginViewModelProvider.notifier)
        .postLocalLogin(
          params: LocalLoginParams(
            email: email,
            password: password,
            keepLoggedIn: _keepLoggedIn,
          ),
        );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _emailController.removeListener(_onEmailRender);
    _passwordController.removeListener(_onPasswordRender);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LocalLoginState state = ref.watch(localLoginViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(localLoginViewModelProvider, (_, LocalLoginState next) async {
      switch (next.status) {
        case Status.success:
          ref.read(loginViewModelProvider.notifier).login();

          // TODO: 개발 하기 편하게 하려고 pushNamed 사용했고, 추후에 goNamed로 바꿀 예정
          unawaited(context.pushNamed(AppRoutes.home.name));

          // /// 로그인 유지가 활성화된 경우
          // if (_keepLoggedIn) {
          //   final TokenInfo tokenInfo = TokenInfo(
          //     accessToken: next.data.accessToken,
          //     refreshToken: next.data.refreshToken,
          //     expiresIn: next.data.expiresIn,
          //     email: _emailController.text,
          //     password: _passwordController.text,
          //   );

          //   const FlutterSecureStorage storage = FlutterSecureStorage();
          //   await storage.write(
          //     key: Constant.tokenInfo,
          //     value: TokenInfo.serialize(tokenInfo: tokenInfo),
          //   );
          // }
          break;

        case Status.failure:
          switch (next.exception.code) {
            case 'A013':
              setState(() {
                isRealTimePasswordError = false;
                _emailError = true;
                _emailErrorText = next.exception.message;
              });
              break;

            case 'A014':
              setState(() {
                isRealTimePasswordError = false;
                _passwordError = true;
                _passwordErrorText = next.exception.message;
              });
              break;

            default:
              unawaited(
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog.basic(
                      description: next.exception.message,
                      primaryButton: CustomDialogButton(
                        text: '확인',
                        onTap: () => context.pop(),
                      ),
                    );
                  },
                ),
              );
          }

        default:
      }
    });

    return CustomLoadingOverlay(
      isLoading: state.status == Status.loading,
      child: Material(
        child: Align(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Assets.image.logo.image(width: 172, fit: BoxFit.fitWidth),
                  const SizedBox(height: 73),

                  CustomInputBox(
                    controller: _emailController,
                    error: _emailError,
                    errorText: _emailErrorText,
                    hintText: '이메일',
                    closeControll: true,
                  ),
                  const SizedBox(height: 12),
                  CustomInputBox(
                    controller: _passwordController,
                    error:
                        isRealTimePasswordError != null &&
                                !isRealTimePasswordError!
                            ? _passwordError
                            : _realTimePasswordError,
                    errorText:
                        isRealTimePasswordError != null &&
                                !isRealTimePasswordError!
                            ? _passwordErrorText
                            : _realTimePasswordErrorText,
                    hintText: '비밀번호',
                    onVisibilityButtonTap: () {
                      setState(() {
                        _visibility = !_visibility;
                      });
                    },
                    visibility: _visibility,
                    closeControll: true,
                    visibilityControll: true,
                  ),
                  const SizedBox(height: 12),

                  /// TODO: 추후에 작업 진행
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     CustomRadioButton.small(
                  //       onTap: () {
                  //         setState(() {
                  //           _keepLoggedIn = !_keepLoggedIn;
                  //         });
                  //       },
                  //       label: '로그인 유지',
                  //       value: _keepLoggedIn,
                  //     ),
                  //     CustomTextButton.underline(
                  //       label: '비밀번호 찾기',
                  //       onPressed: () {},
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 44),
                  CustomFillButton.large(
                    label: '로그인',
                    disabled:
                        !_emailController.text.isEmail ||
                        _passwordController.text.length < 8 ||
                        !_passwordController.text.isPasswordValid ||
                        state.status == Status.loading,
                    onPressed: _onSubmit,
                  ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(vertical: 12),
                  //   child: Stack(
                  //     children: <Widget>[
                  //       const Divider(color: ScaleColorConfig.neutral70),
                  //       Align(
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(horizontal: 16),
                  //           color: ScaleColorConfig.surface90,
                  //           child: Text(
                  //             '또는',
                  //             style: textTheme.labelSmall?.copyWith(
                  //               color: const Color(0xFF6C6C6C),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // /// TODO: 카카오 로그인 연동 해야됨
                  // CustomSnsLoginButton(
                  //   svgImage: Assets.icon.sns.kakao,
                  //   label: '카카오 로그인',
                  //   onPressed: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return CustomDialog.basic(
                  //           description: '서비스 준비중',
                  //           primaryButton: CustomDialogButton(
                  //             text: '확인',
                  //             onTap: () => context.pop(),
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  //   backgroundColor: const Color(0xFFFEE500),
                  //   foregroundColor: const Color(0xFF191919),
                  // ),
                  const SizedBox(height: 34),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '아직 계정이 없으신가요?',
                        style: textTheme.bodySmall?.copyWith(
                          color: ScaleColorConfig.neutral30,
                        ),
                      ),

                      CustomTextButton.underline(
                        label: '회원가입',
                        onPressed: () {
                          context.pushNamed(AppRoutes.signUpStep1.name);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
