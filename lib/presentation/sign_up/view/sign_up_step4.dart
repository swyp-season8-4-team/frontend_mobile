import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_gender_option_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/util/text_line_break.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/sign_up/widget/sign_up_wrapper.dart';
import 'package:go_router/go_router.dart';

class SignUpStep4 extends StatefulWidget {
  const SignUpStep4({super.key});

  @override
  State<SignUpStep4> createState() => _SignUpStep4State();
}

class _SignUpStep4State extends State<SignUpStep4> {
  bool _isSelectedGirl = false;
  bool _isSelectedBoy = false;

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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomProfilePhotoGenderOptionButton.girl(
                        onPressed: () {
                          setState(() {
                            _isSelectedGirl = true;
                            _isSelectedBoy = false;
                          });
                        },
                        isSelected: _isSelectedGirl,
                      ),
                      const SizedBox(width: 18),
                      CustomProfilePhotoGenderOptionButton.boy(
                        onPressed: () {
                          setState(() {
                            _isSelectedGirl = false;
                            _isSelectedBoy = true;
                          });
                        },
                        isSelected: _isSelectedBoy,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          CustomFillButton.large(
            label: '다음',
            disabled: !_isSelectedGirl && !_isSelectedBoy,
            onPressed: () {
              context.pushNamed(AppRoutes.signUpStep5.name);
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 32),
        ],
      ),
    );
  }
}
