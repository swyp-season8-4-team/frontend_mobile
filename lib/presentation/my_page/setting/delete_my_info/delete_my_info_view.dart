import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';

class DeleteMyInfoView extends StatelessWidget {
  const DeleteMyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomSubTopBar(title: '탈퇴하기', actions: <Widget>[]),
    );
  }
}
