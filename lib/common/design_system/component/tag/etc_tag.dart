import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/font_weight/font_weight_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

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
    /// TODO: 타이포그래피 내 텍스트스타일 적용 필요
    const TextStyle baseTextStyle = TextStyle(
      fontSize: 11,
      height: 14 / 11,
      fontWeight: FontWeightConfig.regular,
      color: Color(0xFF393939),
    );
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),

          /// TODO: 컬러 시스템값 적용 필요
          color: const Color(0xFFF5F5F5),
        ),
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2.5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon.svg(),
            const SizedBox(width: 10),
            Text(label, style: baseTextStyle),
          ],
        ),
      ),
    );
  }
}

/// 주차 가능 태그
class CanParkingTag extends StatelessWidget {
  const CanParkingTag({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEtcTag(label: '주차 가능', icon: Assets.icon.etc.a23x16CarFilled);
  }
}

/// 반려동물 동반 태그
class PetTag extends StatelessWidget {
  const PetTag({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEtcTag(
      label: '반려동물 동반',
      icon: Assets.icon.etc.a16x16PetFilled,
    );
  }
}

/// 텀블러 할인 태그
class DiscountTumblerTag extends StatelessWidget {
  const DiscountTumblerTag({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEtcTag(
      label: '텀블러 할인',
      icon: Assets.icon.etc.a13x20TumblerFilled,
    );
  }
}
