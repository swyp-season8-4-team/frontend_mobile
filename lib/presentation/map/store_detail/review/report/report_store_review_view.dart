import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportStoreReviewView extends ConsumerStatefulWidget {
  const ReportStoreReviewView({
    required this.storeUuid,
    required this.reviewUuid,
    super.key,
  });
  final String storeUuid;
  final String reviewUuid;

  @override
  ConsumerState<ReportStoreReviewView> createState() =>
      _ReportReviewViewState();
}

class _ReportReviewViewState extends ConsumerState<ReportStoreReviewView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
