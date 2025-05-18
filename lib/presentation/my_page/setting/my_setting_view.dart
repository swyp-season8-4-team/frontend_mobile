import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/secure_storage/secure_storage.dart';
import 'package:frontend_mobile/presentation/global/login/login_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class MySettingView extends ConsumerWidget {
  const MySettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final UserState userState = ref.watch(userViewModelProvider);

    return Scaffold(
      appBar: const CustomSubTopBar(title: '설정', actions: <Widget>[]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const _MenuTitle(title: '친구 관리'),
              Divider(color: colorScheme.outlineVariant, height: 1),
              _Menu(
                widget: Row(
                  children: <Widget>[
                    Text(
                      '차단 맴버 관리하기',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.neutral30,
                      ),
                    ),
                    const Spacer(),
                    Assets.icon.arrow.rightLine.svg(
                      width: 20,
                      height: 20,
                      colorFilter: const ColorFilter.mode(
                        ScaleColorConfig.neutral40,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  context.pushNamed(AppRoutes.blockedUser.name);
                },
              ),
              Divider(color: colorScheme.outlineVariant, height: 1),
              const _MenuTitle(title: '내 계정'),
              Divider(color: colorScheme.outlineVariant, height: 1),
              _Menu(
                widget: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '이메일 계정',
                        style: textTheme.titleSmall?.copyWith(
                          color: ScaleColorConfig.neutral30,
                        ),
                      ),
                    ),
                    Text(
                      userState.data.email,
                      style: textTheme.labelMedium?.copyWith(
                        color: ScaleColorConfig.primary60,
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
              Divider(color: colorScheme.outlineVariant, height: 1),
              _Menu(
                widget: Row(
                  children: <Widget>[
                    Text(
                      '로그아웃',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.neutral30,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog.basic(
                        title: '로그아웃',
                        description: '로그아웃 하시겠습니까?',
                        primaryButton: CustomDialogButton(
                          text: '로그아웃',
                          onTap: () async {
                            // TODO: 추후 로그아웃 로직 수정 필요

                            // 토큰 정보 삭제
                            await ref
                                .read(secureStorageProvider)
                                .delete(key: Constant.tokenInfo);
                            ref.read(loginViewModelProvider.notifier).logout();
                            if (context.mounted) {
                              context.pop();
                              context.goNamed(AppRoutes.localLogin.name);
                            }
                          },
                        ),
                        footer: CustomDialogButton(
                          text: '닫기',
                          onTap: () {
                            context.pop();
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              Divider(color: colorScheme.outlineVariant, height: 1),
              _Menu(
                widget: Row(
                  children: <Widget>[
                    Text(
                      '탈퇴하기',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.neutral30,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  context.pushNamed(AppRoutes.deleteMyInfo.name);
                },
              ),
              Divider(color: colorScheme.outlineVariant, height: 1),
            ],
          ),
        ),
      ),
    );
  }
}

// 설정 메뉴 구분
class _MenuTitle extends StatelessWidget {
  const _MenuTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
      child: Text(
        title,
        style: textTheme.labelLarge?.copyWith(
          color: ScaleColorConfig.secondary60,
        ),
      ),
    );
  }
}

// 설정 메뉴
class _Menu extends StatelessWidget {
  const _Menu({required this.widget, required this.onTap});
  final Widget widget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          child: widget,
        ),
      ),
    );
  }
}
