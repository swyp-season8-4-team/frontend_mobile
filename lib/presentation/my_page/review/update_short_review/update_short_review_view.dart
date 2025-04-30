import 'package:flutter/material.dart';

class UpdateShortReviewView extends StatefulWidget {
  const UpdateShortReviewView({
    required this.reviewUuid,
    required this.storeUuid,
    super.key,
  });
  final String reviewUuid;
  final String storeUuid;

  @override
  State<UpdateShortReviewView> createState() => _UpdateShortReviewViewState();
}

class _UpdateShortReviewViewState extends State<UpdateShortReviewView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
