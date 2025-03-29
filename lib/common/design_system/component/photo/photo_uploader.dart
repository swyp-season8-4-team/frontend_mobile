import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:image_picker/image_picker.dart';

/// Photo Uploader
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=404-39738&m=dev
class CustomPhotoUploader extends StatefulWidget {
  const CustomPhotoUploader({required this.onImageInsert, super.key});

  // 이미지 삽입 이벤트 콜백
  final FutureOr<void> Function(List<XFile> xFiles) onImageInsert;

  @override
  State<CustomPhotoUploader> createState() => _CustomPhotoUploaderState();
}

class _CustomPhotoUploaderState extends State<CustomPhotoUploader> {
  bool _pressed = false;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onTapDown: (_) => _setPressed(),
      onTapUp: (_) => _unsetPressed(),
      onTapCancel: _unsetPressed,
      child: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.38),
          color: _getBackgroundColor(),
          border: Border.all(color: ScaleColorConfig.neutral40, width: 1.17),
        ),
        child: Center(child: Assets.icon.system.addCircleLine.svg()),
      ),
    );
  }

  void _setPressed() {
    setState(() {
      _pressed = true;
    });
  }

  void _unsetPressed() {
    setState(() {
      _pressed = false;
    });
  }

  Color _getBackgroundColor() {
    if (_pressed) {
      return ScaleColorConfig.neutral50;
    }

    return ScaleColorConfig.neutral70;
  }

  Future<void> _onTap() async {
    final List<XFile> xFiles = await _imagePicker.pickMultiImage();
    widget.onImageInsert(xFiles);
  }
}
