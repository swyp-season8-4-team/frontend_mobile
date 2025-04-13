import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/sign_up/widget/sign_up_wrapper.dart';
import 'package:go_router/go_router.dart';

class SignUpStep3 extends ConsumerStatefulWidget {
  const SignUpStep3({super.key});

  @override
  ConsumerState<SignUpStep3> createState() => _SignUpStep3State();
}

class _SignUpStep3State extends ConsumerState<SignUpStep3> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();

  bool _passwordVisibility = false;
  bool _passwordCheckVisibility = false;

  /// 실시간 입력과 관련된 비밀번호
  bool _realTimePasswordCheckError = false;
  final String _realTimePasswordCheckErrorText = '비밀번호가 서로 일치하지 않습니다';

  bool _realTimePasswordCheckSuccess = false;
  final String _realTimePasswordCheckSuccessText = '비밀번호가 서로 일치합니다';

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordRender);
    _passwordCheckController.addListener(_onPasswordCheckRender);
  }

  void _onPasswordRender() {
    setState(() {});
  }

  void _onPasswordCheckRender() {
    /// 비밀번호가 비어있지 않은 경우
    if (_passwordCheckController.text.isNotEmpty) {
      /// 유효하지 않은 비밀번호인 경우
      if (!_passwordCheckController.text.isPasswordValid) {
        setState(() {
          _realTimePasswordCheckError = true;
          _realTimePasswordCheckSuccess = false;
        });
      }
      /// 비밀번호가 서로 다른 경우
      else if (_passwordController.text != _passwordCheckController.text) {
        setState(() {
          _realTimePasswordCheckError = true;
          _realTimePasswordCheckSuccess = false;
        });
      }
      /// 유효한 비밀번호인 경우
      else {
        setState(() {
          _realTimePasswordCheckError = false;
          _realTimePasswordCheckSuccess = true;
        });
      }
    }
    /// 비밀번호가 비어있는 경우
    else {
      setState(() {
        _realTimePasswordCheckError = false;
        _realTimePasswordCheckSuccess = false;
      });
    }
  }

  @override
  void dispose() {
    _passwordController.removeListener(_onPasswordRender);
    _passwordCheckController.removeListener(_onPasswordCheckRender);
    _passwordController.dispose();
    _passwordCheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomSignUpWrapper(
      title: '비밀번호',
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '비밀번호를 입력해주세요',
                    style: textTheme.titleLarge?.copyWith(
                      color: ScaleColorConfig.primary5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '최소 8자, 영문 소문자, 숫자, 특수문자 조합',
                    style: textTheme.titleSmall?.copyWith(
                      color: ScaleColorConfig.neutral30,
                    ),
                  ),
                  const SizedBox(height: 37),

                  CustomInputBox(
                    controller: _passwordController,
                    hintText: '비밀번호',
                    visibility: _passwordVisibility,
                    error: _realTimePasswordCheckError,
                    onVisibilityButtonTap: () {
                      setState(() {
                        _passwordVisibility = !_passwordVisibility;
                      });
                    },
                    closeControll: true,
                    visibilityControll: true,
                  ),
                  const SizedBox(height: 16),
                  CustomInputBox(
                    controller: _passwordCheckController,
                    hintText: '비밀번호 확인',
                    visibility: _passwordCheckVisibility,
                    error: _realTimePasswordCheckError,
                    errorText: _realTimePasswordCheckErrorText,
                    success: _realTimePasswordCheckSuccess,
                    successText: _realTimePasswordCheckSuccessText,
                    onVisibilityButtonTap: () {
                      setState(() {
                        _passwordCheckVisibility = !_passwordCheckVisibility;
                      });
                    },
                    closeControll: true,
                    visibilityControll: true,
                  ),
                ],
              ),
            ),
          ),
          CustomFillButton.large(
            label: '다음',
            disabled:
                !(_passwordController.text.isNotEmpty &&
                    _passwordCheckController.text.isNotEmpty &&
                    _passwordController.text == _passwordCheckController.text &&
                    !_realTimePasswordCheckError),
            onPressed: () {
              context.pushNamed(AppRoutes.signUpStep4.name);
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
        ],
      ),
    );
  }
}
