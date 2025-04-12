import 'package:flutter/material.dart';

class GlobalLoadingOverlay {
  factory GlobalLoadingOverlay() {
    return _instance;
  }
  GlobalLoadingOverlay._();

  static final GlobalLoadingOverlay _instance = GlobalLoadingOverlay._();

  OverlayEntry? _overlayEntry;

  void show({required BuildContext context}) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder:
          (_) => Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  color: Colors.black45,
                  child: const Align(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
