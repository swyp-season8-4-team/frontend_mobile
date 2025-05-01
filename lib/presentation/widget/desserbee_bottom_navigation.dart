import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/navigation_bar.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

/// 앱의 최상단 페이지에서 사용될 Bottom Navigation Bar
class DesserbeeBottomNavigation extends StatelessWidget {
  const DesserbeeBottomNavigation({required this.currentItemType, super.key});
  final NavigationItemType currentItemType;

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      list: <NavigationBarType>[
        NavigationBarType(
          svg: Assets.icon.dessert.donutLine,
          label: '커뮤니티',
          onTap: () {
            context.goNamed(AppRoutes.dessertBoard.name);
          },
          itemType: NavigationItemType.mate,
        ),
        NavigationBarType(
          svg: Assets.icon.map.mapLine,
          label: '지도',
          onTap: () {
            context.goNamed(AppRoutes.map.name);
          },
          itemType: NavigationItemType.map,
        ),
        NavigationBarType(
          svg: Assets.icon.user.user3Line,
          label: 'MY',
          onTap: () {
            context.goNamed(AppRoutes.myPageDefault.name);
          },
          itemType: NavigationItemType.my,
        ),
      ],
      currentItemType: currentItemType,
    );
  }
}
