import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/sns_login_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/radio/radio_button.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
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

  /// 실시간 입력과 관련된 비밀번호
  bool _realTimePasswordError = false;
  final String _realTimePasswordErrorText = '비밀번호를 다시 입력해주세요';

  /// api 통신와 관련된 비밀번호
  bool _passwordError = false;
  String _passwordErrorText = '';

  bool _keepLoggedIn = false;
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

    ref.listen(localLoginViewModelProvider, (_, LocalLoginState next) {
      switch (next.status) {
        case Status.success:
          // TODO: 개발 하기 편하게 하려고 pushNamed 사용했고, 추후에 goNamed로 바꿀 예정
          context.pushNamed(AppRoutes.home.name);
          break;
        case Status.failure:
          switch (next.exception.code) {
            case 'A013':
              setState(() {
                _emailError = true;
                _emailErrorText = next.exception.message;
              });
              break;
            case 'A014':
              setState(() {
                _passwordError = true;
                _passwordErrorText = next.exception.message;
              });
            default:
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
                  ),
                  const SizedBox(height: 12),
                  CustomInputBox(
                    controller: _passwordController,
                    error:
                        state.status == Status.failure
                            ? _passwordError
                            : _realTimePasswordError,
                    errorText:
                        state.status == Status.failure
                            ? _passwordErrorText
                            : _realTimePasswordErrorText,
                    hintText: '비밀번호',
                    onVisibilityButtonTap: () {
                      setState(() {
                        _visibility = !_visibility;
                      });
                    },
                    visibility: _visibility,
                    visibilityControll: true,
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /// TODO: 로그인 유지를 누르면 자동 로그인 되도록 구현해야 됨
                      /// api/users/me api 사용
                      CustomRadioButton.small(
                        onTap: () {
                          setState(() {
                            _keepLoggedIn = !_keepLoggedIn;
                          });
                        },
                        label: '로그인 유지',
                        value: _keepLoggedIn,
                      ),
                      CustomTextButton.underline(
                        label: '비밀번호 찾기',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),

                  CustomFillButton(
                    label: '로그인',
                    disabled:
                        _passwordController.text.length < 8 ||
                        !_passwordController.text.isPasswordValid ||
                        state.status == Status.loading,
                    onPressed: _onSubmit,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: Stack(
                      children: <Widget>[
                        const Divider(color: ScaleColorConfig.neutral70),
                        Align(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            color: ScaleColorConfig.surface90,
                            child: Text(
                              '또는',
                              style: textTheme.labelSmall?.copyWith(
                                color: const Color(0xFF6C6C6C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// TODO: 카카오 로그인 연동 해야됨
                  CustomSnsLoginButton(
                    svgImage: Assets.icon.sns.kakao,
                    label: '카카오 로그인',
                    onPressed: () {},
                    backgroundColor: const Color(0xFFFEE500),
                    foregroundColor: const Color(0xFF191919),
                  ),
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

                      /// TODO: 회원가입 구현해야 됨
                      CustomTextButton.underline(
                        label: '회원가입',
                        onPressed: () {},
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
