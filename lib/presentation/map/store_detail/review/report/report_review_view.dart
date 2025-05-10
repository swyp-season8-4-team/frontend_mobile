import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportReviewView extends ConsumerStatefulWidget {
  const ReportReviewView({
    required this.storeUuid,
    required this.reviewUuid,
    super.key,
  });
  final String storeUuid;
  final String reviewUuid;

  @override
  ConsumerState<ReportReviewView> createState() => _ReportReviewViewState();
}

class _ReportReviewViewState extends ConsumerState<ReportReviewView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
