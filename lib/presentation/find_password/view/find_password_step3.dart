import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
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

  /// '비밀번호 확인' 실시간 비밀번호 에러
  bool _realTimePasswordCheckError = false;
  String _realTimePasswordCheckErrorText = '';

  /// '비밀번호 확인' 실시간 비밀번호 성공
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
      if (!_passwordController.text.isPasswordValid) {
        setState(() {
          _realTimePasswordCheckError = true;
          _realTimePasswordCheckErrorText =
              '최소 8자, 영문 소문자, 숫자, 특수문자 조합를 지켜주세요.';
          _realTimePasswordCheckSuccess = false;
        });
      }
      /// 비밀번호가 서로 다른 경우
      else if (_passwordController.text != _passwordCheckController.text) {
        setState(() {
          _realTimePasswordCheckError = true;
          _realTimePasswordCheckErrorText = '비밀번호가 서로 일치하지 않습니다';
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

  void _onSubmit() {
    /// TODO: 비밀번호 변경 api 완성되면 연결해야 함
    ///

    // ref
    //     .read(findPasswordViewModelProvider.notifier)
    //     .postPasswordReset(
    //       params: PasswordResetParams(
    //         emailToken: emailToken,
    //         email: email,
    //         currentPassword: currentPassword,
    //         newPassword: newPassword,
    //       ),
    //     );
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
                    success: _realTimePasswordCheckSuccess,
                    successText: _realTimePasswordCheckSuccessText,
                    error: _realTimePasswordCheckError,
                    errorText: _realTimePasswordCheckErrorText,
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
            onPressed: _onSubmit,
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
        ],
      ),
    );
  }
}
