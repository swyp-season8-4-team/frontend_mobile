import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';

class CustomSignUpWrapper extends StatelessWidget {
  const CustomSignUpWrapper({
    required this.child,
    required this.title,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSubTopBar(
        title: title,
        primary: false,
        actions: const <Widget>[],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 45),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: child,
      ),
    );
  }
}
