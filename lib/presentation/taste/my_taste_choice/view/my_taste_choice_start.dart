import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/presentation/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class MyTasteChoiceStart extends ConsumerStatefulWidget {
  const MyTasteChoiceStart({super.key});

  @override
  ConsumerState<MyTasteChoiceStart> createState() => _MyTasteChoiceStartState();
}

class _MyTasteChoiceStartState extends ConsumerState<MyTasteChoiceStart> {
  @override
  Widget build(BuildContext context) {
    final PreferenceState state = ref.watch(preferenceViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      child: CustomLoadingOverlay(
        isLoading: state.status.isLoading,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40),

                  Text(
                    '디저트 취향을 설정하면\n맞춤 가게를 추천받을 수 있어요',
                    style: textTheme.titleLarge?.copyWith(
                      color: ScaleColorConfig.primary5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),

                  Text(
                    '10초면 충분해요',
                    style: textTheme.bodyLarge?.copyWith(
                      color: ScaleColorConfig.neutral30,
                    ),
                  ),
                  const SizedBox(height: 26),

                  Container(
                    width: double.infinity,
                    height: 272,
                    color: const Color(0xFFE8E8E8),
                    child: const Align(child: Text('Illust-area')),
                  ),
                  const SizedBox(height: 30),

                  CustomFillButton.large(
                    label: '내 취향 설정하기',
                    onPressed: () async {
                      await ref
                          .read(preferenceViewModelProvider.notifier)
                          .getAllPreferences();

                      if (context.mounted) {
                        unawaited(
                          context.pushNamed(AppRoutes.myTasteChoiceStep1.name),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 12),

                  /// TODO: 어디로 이동할지 설정
                  CustomTextButton(label: '다음에 할래요', onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
