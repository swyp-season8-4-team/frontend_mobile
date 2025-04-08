import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:frontend_mobile/common/design_system/component/checkbox/checkbox.dart';
import 'package:frontend_mobile/common/design_system/component/etc/marker/saved_marker.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Map Save List
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000781-244763&m=dev
class CustomSavedStoreList extends StatelessWidget {
  const CustomSavedStoreList.withCheckbox({
    required this.leftIconColor,
    required this.name,
    required this.storeLength,
    required this.onCheckboxTap,
    required this.checked,
    required this.onTap,
    this.backgroundColor,
    super.key,
  }) : optionMenus = null,
       hasOptionMenus = false,
       optionMenusVisible = false,
       onOptionMenusTap = null;

  const CustomSavedStoreList.withOptionMenus({
    required this.leftIconColor,
    required this.name,
    required this.storeLength,
    required this.optionMenus,
    required this.optionMenusVisible,
    required this.onOptionMenusTap,
    required this.onTap,
    this.backgroundColor,
    super.key,
  }) : onCheckboxTap = null,
       hasOptionMenus = true,
       checked = false;

  // 좌측 꽃 아이콘 컬러
  final Color leftIconColor;
  final String name;

  // 저장한 가게의 개수
  final int storeLength;

  // 체크 여부
  final bool checked;
  final VoidCallback? onCheckboxTap;
  final bool hasOptionMenus;
  final Color? backgroundColor;

  // 옵션 메뉴 목록
  final List<CustomOptionMenu>? optionMenus;

  // 옵션 메뉴 드롭다운 표시 여부
  final bool optionMenusVisible;

  // 우측 옵션 메뉴 목록 버튼 아이콘
  final VoidCallback? onOptionMenusTap;

  // 컴포넌트 탭 이벤트 콜백
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 60,
        color: backgroundColor,
        child: Row(
          children: <Widget>[
            CustomSavedMarker(backgroundColor: leftIconColor),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name,
                    style: textTheme.titleSmall?.copyWith(color: Colors.black),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Assets.icon.map.locationLine.svg(
                        width: 14,
                        height: 14,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                          ScaleColorConfig.neutral50,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        storeLength.toString(),
                        style: textTheme.labelMedium?.copyWith(
                          color: ScaleColorConfig.neutral50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (hasOptionMenus)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: PortalTarget(
                  // 표출될 드롭다운 위젯 지정
                  portalFollower: Padding(
                    padding: const EdgeInsets.only(top: 4, right: 4),
                    child: CustomOptionMenuDropdown(optionMenus: optionMenus!),
                  ),
                  anchor: const Aligned(
                    follower: Alignment.topRight,
                    target: Alignment.bottomRight,
                  ),
                  visible: optionMenusVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: GestureDetector(
                      onTap: onOptionMenusTap,
                      child: Assets.icon.menu.more2Fill.svg(
                        colorFilter: const ColorFilter.mode(
                          ScaleColorConfig.neutral50,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            else
              CustomCheckBox(onTap: onCheckboxTap!, value: checked),
          ],
        ),
      ),
    );
  }
}
