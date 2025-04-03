import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// 기타 태그 (Etc Tag)
/// https://www.figma.com/design/Cmw8GLJYfuUVf9A3QNxqgW/SWYP_%EC%95%B1_1%EA%B8%B0_%EB%94%94%EC%A0%80%EB%B9%84?node-id=398-38295&t=NaNRsPzG4mCFiRIR-4
class CustomEtcTag extends StatelessWidget {
  const CustomEtcTag({
    required this.label,
    required this.icon,
    this.onTap,
    super.key,
  });
  final String label;
  final VoidCallback? onTap;
  final SvgGenImage icon;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ScaleColorConfig.neutral80,
        ),
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon.svg(),
            const SizedBox(width: 4),
            Text(
              label,
              style: textTheme.labelSmall?.copyWith(
                color: ScaleColorConfig.neutral30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 주차 가능 태그 (Etc Tag 기반)
class CanParkingTag extends StatelessWidget {
  const CanParkingTag({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEtcTag(label: '주차 가능', icon: Assets.icon.etc.a20CarFilled);
  }
}

/// 반려동물 동반 태그 (Etc Tag 기반)
class PetTag extends StatelessWidget {
  const PetTag({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEtcTag(label: '반려 함께', icon: Assets.icon.etc.a20PetFilled);
  }
}

/// 텀블러 할인 태그 (Etc Tag 기반)
class DiscountTumblerTag extends StatelessWidget {
  const DiscountTumblerTag({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEtcTag(label: '텀블러 할인', icon: Assets.icon.etc.a20TumblrFilled);
  }
}
