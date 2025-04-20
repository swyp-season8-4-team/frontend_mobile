import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/text_button.dart';
import 'package:frontend_mobile/common/design_system/component/hexagon_grid/hexagon_grid.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class TasteResult extends StatelessWidget {
  const TasteResult({
    required this.nickname,
    required this.preferences,
    super.key,
  });

  final String nickname;
  final List<PreferenceModel> preferences;

  Widget _body({required TextTheme textTheme}) {
    if (preferences.isEmpty) {
      return Column(
        children: <Widget>[
          /// FIXME: 텍스트 스타일 정의되면 고쳐야 함
          const Text(
            '디저비가 취향을 찾아줄게요',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              height: 28 / 22,
              color: ScaleColorConfig.primary50,
            ),
          ),
          const SizedBox(height: 8),

          Text(
            "메인 지도에서 '내 취향'을 누르면\n내 취향 100% 가게 리스트를 볼 수 있어요",
            style: textTheme.bodyMedium?.copyWith(
              color: ScaleColorConfig.neutral30,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          Assets.image.restBee1.image(),
        ],
      );
    }

    return Column(
      children: <Widget>[
        /// FIXME: 텍스트 스타일 정의되면 고쳐야 함
        Text(
          '$nickname 님',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 28 / 22,
            color: ScaleColorConfig.primary50,
          ),
        ),

        /// FIXME: 텍스트 스타일 정의되면 고쳐야 함
        const Text(
          '취향을 분석해 보았어요',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 28 / 22,
            color: ScaleColorConfig.primary5,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          "메인 지도에서 '내 취향'을 누르면\n내 취향 100% 가게 리스트를 볼 수 있어요",
          style: textTheme.bodyMedium?.copyWith(
            color: ScaleColorConfig.neutral30,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        SizedBox(
          height: 417,
          child: CustomHexagonGrid(
            hexagons:
                preferences.map((PreferenceModel e) {
                  return CustomHexagon(text: e.preferenceName);
                }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),

            _body(textTheme: textTheme),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  CustomFillButton.large(
                    label: '메인으로',
                    onPressed: () {
                      context.goNamed(AppRoutes.map.name);
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomTextButton(
                    label: '다시하기',
                    onPressed: () {
                      context.goNamed(AppRoutes.myTasteChoiceStart.name);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
