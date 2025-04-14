import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';

class StoreDetailView extends StatefulWidget {
  const StoreDetailView({required this.storeUuid, super.key});
  final String storeUuid;

  @override
  State<StoreDetailView> createState() => _StoreDetailViewState();
}

class _StoreDetailViewState extends State<StoreDetailView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomSubTopBar(title: '', actions: <Widget>[]),
    );
  }
}
