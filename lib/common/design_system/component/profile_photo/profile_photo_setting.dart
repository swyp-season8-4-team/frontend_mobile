import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_btc.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:image_picker/image_picker.dart';

class CustomProfilePhotoSetting extends StatefulWidget {
  const CustomProfilePhotoSetting.girl({super.key}) : isGirl = true;

  const CustomProfilePhotoSetting.boy({super.key}) : isGirl = false;

  final bool isGirl;

  @override
  State<CustomProfilePhotoSetting> createState() =>
      _CustomProfilePhotoSettingState();
}

class _CustomProfilePhotoSettingState extends State<CustomProfilePhotoSetting> {
  File? _imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Widget get _image {
    if (widget.isGirl) {
      return CustomProfilePhotoSize.girl();
    }

    return CustomProfilePhotoSize.boy();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _imageFile == null
            ? _image
            : Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.file(
                _imageFile!,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CustomProfilePhotoBtc(
            type: CustomProfilePhotoBtcType.camera,
            onPressed: () async {
              final XFile? xFile = await imagePicker.pickImage(
                source: ImageSource.gallery,
              );

              if (xFile != null) {
                setState(() {
                  _imageFile = File(xFile.path);
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
