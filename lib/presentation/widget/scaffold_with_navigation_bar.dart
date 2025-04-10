import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/navigation_bar.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

/// 바텀 네비게이션바를 포함한 Scaffold 모듈
class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.drawer,
    super.key,
  });
  final AppBar? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
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
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      drawer: drawer,
    );
  }
}
