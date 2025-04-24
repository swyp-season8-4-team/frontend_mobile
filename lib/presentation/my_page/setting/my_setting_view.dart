import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';

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
                onTap: () {},
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
                onTap: () {},
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
        child: widget,
      ),
    );
  }
}
