import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/presentation/widget/desserbee_bottom_navigation.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final TopBarIcon _topBarIcon = TopBarIcon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSubTopBar(
        leading: const SizedBox.shrink(),
        title: 'MY',
        actions: <Widget>[_topBarIcon.setting(onTap: () {})],
      ),
      bottomNavigationBar: const DesserbeeBottomNavigation(),
    );
  }
}
