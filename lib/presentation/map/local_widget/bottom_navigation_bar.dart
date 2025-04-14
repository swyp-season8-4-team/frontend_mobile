part of '../map_view.dart';

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: CustomNavigationBar(
        list: <NavigationBarType>[
          NavigationBarType(
            svg: Assets.icon.map.mapLine,
            label: '지도',
            onTap: () {
              context.goNamed(AppRoutes.map.name);
            },
          ),
        ],
      ),
    );
  }
}
