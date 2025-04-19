import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// 상단바에서 사용할 아이콘을 정의하는 클래스
class TopBarIcon {
  /// 상단바에서 사용할 아이콘을 정의하는 클래스
  factory TopBarIcon() {
    return _instance;
  }

  TopBarIcon._();

  static TopBarIcon get _instance => TopBarIcon._();

  /// 아이콘 리스트들의 간격을 8만큼 준 뒤, 리스트를 반환하는 함수
  static toList(List<Widget> list) {
    return List<Widget>.generate(list.length, (int index) {
      final Widget item = list[index];

      if (index == list.length - 1) {
        return item;
      }

      return Container(margin: const EdgeInsets.only(right: 8), child: item);
    });
  }

  /// 뒤로가기
  GestureDetector leftLine({required VoidCallback? onTap}) =>
      GestureDetector(onTap: onTap, child: Assets.icon.arrow.leftLine.svg());

  /// 알림
  GestureDetector notification({
    required VoidCallback? onTap,
    bool alert = false,
  }) => GestureDetector(
    onTap: onTap,
    child: Stack(
      children: <Widget>[
        Assets.icon.media.notificationLine.svg(),
        if (alert)
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: ScaleColorConfig.error50,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    ),
  );

  /// 검색
  GestureDetector search({required VoidCallback? onTap}) =>
      GestureDetector(onTap: () {}, child: Assets.icon.file.search1Line.svg());

  /// 공유
  GestureDetector share({required VoidCallback? onTap}) =>
      GestureDetector(onTap: () {}, child: Assets.icon.system.share2Line.svg());

  /// 북마크
  GestureDetector bookMark({required VoidCallback? onTap}) => GestureDetector(
    onTap: () {},
    child: Assets.icon.editor.bookmarkLine.svg(),
  );

  /// 닫기
  GestureDetector close({required VoidCallback? onTap}) =>
      GestureDetector(onTap: onTap, child: Assets.icon.system.closeLine.svg());
}
