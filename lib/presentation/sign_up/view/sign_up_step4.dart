import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/util/text_line_break.dart';
import 'package:frontend_mobile/presentation/sign_up/widget/sign_up_wrapper.dart';

class SignUpStep4 extends StatelessWidget {
  const SignUpStep4({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomSignUpWrapper(
      title: '기본 프로필',
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextLineBreak(
                    text: '프로필 작성 전 회원님의 성별을 알려주세요',
                    style: textTheme.titleLarge?.copyWith(
                      color: ScaleColorConfig.primary5,
                    ),
                  ),
                  const SizedBox(height: 45),

                  /// TODO: profile photo 적용할 예정
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text('남자'), Text('여자')],
                  ),
                ],
              ),
            ),
          ),

          /// TODO:
          CustomFillButton.large(
            label: '다음',
            // disabled: !_isValidEmail,
            onPressed: () {
              // context.pushNamed(
              //   AppRoutes.signUpStep2.name,
              //   extra: _emailController.text,
              // );
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
        ],
      ),
    );
  }
}
