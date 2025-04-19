import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';

class CustomMyTasteWrapper extends StatelessWidget {
  const CustomMyTasteWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomSubTopBar(
        title: '내 취향 설정',
        primary: false,
        actions: <Widget>[],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child,
      ),
    );
  }
}
