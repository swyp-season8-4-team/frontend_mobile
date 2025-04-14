import 'package:flutter/material.dart';

class StoreDetailView extends StatefulWidget {
  const StoreDetailView({required this.storeUuid, super.key});
  final String storeUuid;

  @override
  State<StoreDetailView> createState() => _StoreDetailViewState();
}

class _StoreDetailViewState extends State<StoreDetailView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
