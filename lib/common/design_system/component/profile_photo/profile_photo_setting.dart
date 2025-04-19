import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_btc.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_image_cropper/native_image_cropper.dart';

class CustomProfilePhotoSetting extends StatefulWidget {
  const CustomProfilePhotoSetting.girl({required this.onCameraTap, super.key})
    : isGirl = true;

  const CustomProfilePhotoSetting.boy({required this.onCameraTap, super.key})
    : isGirl = false;

  final bool isGirl;
  final void Function(Uint8List) onCameraTap;

  @override
  State<CustomProfilePhotoSetting> createState() =>
      _CustomProfilePhotoSettingState();
}

class _CustomProfilePhotoSettingState extends State<CustomProfilePhotoSetting> {
  XFile? xFile;
  Uint8List? _croppedImageBytes;
  CropController _cropController = CropController();

  Widget get _image {
    if (_croppedImageBytes != null) {
      return ClipOval(
        child: Image.memory(
          _croppedImageBytes!,
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
      );
    }

    return widget.isGirl
        ? CustomProfilePhotoSize.girl(onPressed: null)
        : CustomProfilePhotoSize.boy(onPressed: null);
  }

  Future<void> _pickAndCropImage({required BuildContext context}) async {
    xFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      final Uint8List bytes = await xFile!.readAsBytes();

      if (context.mounted) {
        await Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.black,
                  body: Column(
                    children: <Widget>[
                      Expanded(
                        child: CropPreview(
                          bytes: bytes,
                          controller: _cropController,
                          mode: CropMode.oval,
                          maskOptions: const MaskOptions(
                            aspectRatio: 1,
                            borderColor: Colors.transparent,
                          ),
                          dragPointBuilder:
                              (double size, CropDragPointPosition pos) =>
                                  const CropDragPoint(
                                    size: 12,
                                    color: ScaleColorConfig.primary80,
                                  ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomFillButton.large(
                                label: '취소',
                                backgroundColor: CustomFillButtonColor.olive,
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: CustomFillButton.large(
                                label: '적용',
                                onPressed: () async {
                                  final Uint8List imageBytes =
                                      await _cropController.crop(
                                        format: ImageFormat.png,
                                      );

                                  widget.onCameraTap(imageBytes);

                                  setState(() {
                                    _croppedImageBytes = imageBytes;
                                  });

                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _image,
        Positioned(
          bottom: 0,
          right: 0,
          child: CustomProfilePhotoBtc(
            type: CustomProfilePhotoBtcType.camera,
            onPressed: () {
              _cropController.dispose();
              _cropController = CropController();
              _pickAndCropImage(context: context);
            },
          ),
        ),
      ],
    );
  }
}
