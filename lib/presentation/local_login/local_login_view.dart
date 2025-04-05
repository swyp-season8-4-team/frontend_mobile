import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/radio/radio_button.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/param/auth/local_login_params.dart';
import 'package:frontend_mobile/presentation/local_login/local_login_view_model.dart';

class LocalLoginView extends ConsumerStatefulWidget {
  const LocalLoginView({super.key});

  @override
  ConsumerState<LocalLoginView> createState() => _LocalLoginViewState();
}

class _LocalLoginViewState extends ConsumerState<LocalLoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref
      //     .read(localLoginViewModelProvider.notifier)
      //     .postLocalLogin(
      //       params: LocalLoginParams(
      //         email: 'dudals9701@naver.com',
      //         password: 'Test1234!',
      //         keepLoggedIn: true,
      //       ),
      //     );
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    // if (localLoginState.status == Status.loading) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Assets.image.logo.path,
                width: 172,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 73),

              CustomInputBox.input(
                controller: _emailController,
                hintText: '이메일',
              ),
              const SizedBox(height: 12),
              CustomInputBox.input(
                controller: _passwordController,
                hintText: '비밀번호',
                onVisibilityButtonTap: () {},
                visibilityControll: true,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CustomRadioButton(onTap: () {}, value: true),
                      const SizedBox(width: 2),
                      Text(
                        '로그인 유지',
                        style: textTheme.labelLarge?.copyWith(
                          color: ScaleColorConfig.neutral30,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '비밀번호 찾기',
                    style: textTheme.labelLarge?.copyWith(
                      color: ScaleColorConfig.secondary30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44),

              CustomFillButton(
                label: '로그인',
                onPressed: () {
                  ref
                      .read(localLoginViewModelProvider.notifier)
                      .postLocalLogin(
                        params: LocalLoginParams(
                          email: _emailController.text,
                          password: _passwordController.text,
                          keepLoggedIn: true,
                        ),
                      );
                },
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
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  Assets.image.kakaoLogin.path,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
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
                  CustomTextButton.underline(label: '회원가입', onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
