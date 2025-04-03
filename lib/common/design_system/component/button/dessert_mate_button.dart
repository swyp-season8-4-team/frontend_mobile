import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/shadow/shadow_config.dart';

class CustomDessertMateButton extends StatelessWidget {
  const CustomDessertMateButton({required this.onPressed, super.key});

  final VoidCallback? onPressed;

  WidgetStateProperty<Color?> get _backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        /// Presssed
        if (states.contains(WidgetState.pressed)) {
          return ScaleColorConfig.primary70;
        }

        /// Enabled
        return ScaleColorConfig.primary80;
      });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        boxShadow: ShadowConfig().level1,
        borderRadius: BorderRadius.circular(6),
      ),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: Size.zero,
          foregroundColor: ScaleColorConfig.primary20,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.all(2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: textTheme.labelLarge,
        ).copyWith(backgroundColor: _backgroundColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: ScaleColorConfig.neutral90,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.network(
                'https://media.istockphoto.com/id/1272346946/ko/%EB%B2%A1%ED%84%B0/%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD-%ED%8F%89%EB%A9%B4-%EB%94%94%EC%9E%90%EC%9D%B8-%EA%B3%BC%EC%9D%BC-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8%EC%97%90-%EA%B3%A0%EB%A6%BD-%EB%90%9C-%EB%85%B9%EC%83%89-%EC%9E%8E%EA%B3%BC-%EB%B9%A8%EA%B0%84-%EC%82%AC%EA%B3%BC.jpg?s=612x612&w=0&k=20&c=LNBh3TjJuN0phNd4w116zcV4P_vC_1M1bqTpSZovCtk=',
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(width: 2),
            const SizedBox(
              child: Text(
                '디저트 메이트',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xFF504209),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
