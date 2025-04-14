import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';

class CustomFindPasswordWrapper extends StatelessWidget {
  const CustomFindPasswordWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomSubTopBar(
        title: '비밀번호 재설정',
        primary: false,
        actions: <Widget>[],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 45),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child,
      ),
    );
  }
}
