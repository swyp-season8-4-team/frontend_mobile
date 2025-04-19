import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/user/user_detail_model.dart';
import 'package:frontend_mobile/domain/param/user/patch_me_params.dart';
import 'package:frontend_mobile/presentation/global/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/taste/my_taste_choice/my_taste_choice_view_model.dart';
import 'package:go_router/go_router.dart';

class TasteResultLoading extends ConsumerStatefulWidget {
  const TasteResultLoading({super.key});

  @override
  ConsumerState<TasteResultLoading> createState() => _TasteResultLoadingState();
}

class _TasteResultLoadingState extends ConsumerState<TasteResultLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;

  /// logo_bee가 몇 초 간격으로 움직이도록 설정하는 타이머
  Timer? _timer;
  double _begin = 0.0;
  double _end = 0.0;
  final double _step = 72.0;
  final double _maxOffset = 72.0 * 3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward().then((_) => _startTimer());

    _end = _begin + _step;
    _offsetAnimation = Tween<double>(
      begin: _begin,
      end: _end,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final MyTasteChoiceState state = ref.read(myTasteChoiceViewModelProvider);

      final List<int> totalPreference =
          state.preferenceStep1 +
          state.preferenceStep2 +
          state.preferenceStep3 +
          state.preferenceStep4;

      ref
          .read(userViewModelProvider.notifier)
          .patchMe(params: PatchMeParams(preferences: totalPreference));

      ref.invalidate(myTasteChoiceViewModelProvider);
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 800), (_) {
      if (_controller.isAnimating) return;

      _begin = _end;
      _end += _step;
      if (_end >= _maxOffset) {
        _end = 0.0;
      }

      _offsetAnimation = Tween<double>(
        begin: _begin,
        end: _end,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      _controller.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Widget get _logoBee => AnimatedBuilder(
    animation: _offsetAnimation,
    builder: (BuildContext context, Widget? child) {
      return Transform.translate(
        offset: Offset(_offsetAnimation.value, 0),
        child: child,
      );
    },
    child: Assets.image.logoBeeInversion.image(width: _step),
  );

  @override
  Widget build(BuildContext context) {
    final PreferenceState state = ref.watch(preferenceViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    ref.listen(userViewModelProvider, (_, UserState next) {
      switch (next.status) {
        case Status.success:
          final UserDetailModel user = next.data;
          final List<PreferenceModel> result = <PreferenceModel>[];

          for (final int item in user.preferences) {
            final List<PreferenceModel> preference =
                state.data
                    .where((PreferenceModel element) => element.id == item)
                    .toList();

            if (preference.isNotEmpty) {
              result.add(preference[0]);
            }
          }

          Future<void>.delayed(const Duration(milliseconds: 1500), () {
            if (context.mounted) {
              context.goNamed(
                AppRoutes.tasteResult.name,
                extra: <String, Object>{
                  'nickname': user.nickname,
                  'preferences': result,
                },
              );
            }
          });
          break;

        case Status.failure:
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
          break;

        default:
      }
    });

    return Material(
      child: Center(
        child: SizedBox(
          width: _maxOffset,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(alignment: Alignment.centerLeft, child: _logoBee),
              const SizedBox(height: 9),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: _step,
                    child: Assets.icon.etc.hexagon11.svg(),
                  ),
                  SizedBox(
                    width: _step,
                    child: Assets.icon.etc.hexagon12.svg(),
                  ),
                  SizedBox(
                    width: _step,
                    child: Assets.icon.etc.hexagon13.svg(),
                  ),
                ],
              ),
              const SizedBox(height: 31),
              Text(
                '열심히 취향 분석 중입니다...🐝',
                style: textTheme.bodyLarge?.copyWith(
                  color: ScaleColorConfig.neutral20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
