import 'package:flutter/material.dart';

class CustomLoadingOverlay extends StatelessWidget {
  const CustomLoadingOverlay({
    required this.child,
    required this.isLoading,
    super.key,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,

        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black45,
              child: const Align(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}
