import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/enum.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/util/find_password_wrapper.dart';
import 'package:frontend_mobile/presentation/find_password/find_password_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class FindPasswordStep3 extends ConsumerStatefulWidget {
  const FindPasswordStep3({super.key});

  @override
  ConsumerState<FindPasswordStep3> createState() => _FindPasswordStep3State();
}

class _FindPasswordStep3State extends ConsumerState<FindPasswordStep3> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();

  bool _passwordVisibility = false;
  bool _passwordCheckVisibility = false;

  bool _passwordError = false;
  final String _passwordErrorText = '';

  /// 실시간 입력과 관련된 비밀번호
  bool _realTimePasswordCheckError = false;
  final String _realTimePasswordCheckErrorText = '비밀번호를 다시 입력해주세요';

  /// api 통신와 관련된 비밀번호
  bool _passwordCheckError = false;
  String _passwordCheckErrorText = '';

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
    if (_passwordCheckController.text.isNotEmpty &&
        !_passwordCheckController.text.isPasswordValid) {
      setState(() {
        _realTimePasswordCheckError = true;
      });
    } else {
      setState(() {
        _realTimePasswordCheckError = false;
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

  void _onNextButton() {
    if (_passwordController.text != _passwordCheckController.text) {
      setState(() {
        _passwordError = true;
        _passwordCheckError = true;
        _passwordCheckErrorText = '비밀번호가 서로 일치하지 않습니다.';
      });
      return;
    }

    if (!_passwordController.text.isPasswordValid) {
      setState(() {
        _passwordError = true;
        _passwordCheckError = true;
        _passwordCheckErrorText = '최소 8자, 영문 소문자, 숫자, 특수문자 조합를 지켜주세요.';
      });
      return;
    }

    setState(() {
      _passwordError = false;
      _passwordCheckError = false;
    });

    /// TODO: 비밀번호 변경 api 완성되면 연결해야 함
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog.basic(
          title: '비밀번호 변경 성공',
          description: '이제 새 비밀번호로 \n 로그인할 수 있습니다.',
          primaryButton: CustomDialogButton(
            text: '로그인 하기',
            onTap: () => context.goNamed(AppRoutes.localLogin.name),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final FindPasswordState state = ref.watch(findPasswordViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    /// TODO: 비밀번호 변경 api 관련 ref.listen 만들기

    return CustomFindPasswordWrapper(
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '새 비밀번호를 입력해주세요',
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
                    error: _passwordError,
                    errorText: _passwordErrorText,
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
                    error:
                        state.passwordStatus == Status.failure
                            ? _passwordCheckError
                            : _realTimePasswordCheckError,
                    errorText:
                        state.passwordStatus == Status.failure
                            ? _passwordCheckErrorText
                            : _realTimePasswordCheckErrorText,
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
                    !_passwordError &&
                    !_realTimePasswordCheckError &&
                    !_passwordCheckError),
            onPressed: _onNextButton,
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
        ],
      ),
    );
  }
}
