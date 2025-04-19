import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_btc.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';

class CustomProfilePhotoEdit extends StatelessWidget {
  const CustomProfilePhotoEdit.girl({super.key}) : isGirl = true;

  const CustomProfilePhotoEdit.boy({super.key}) : isGirl = false;

  final bool isGirl;

  Widget get _image {
    if (isGirl) {
      return CustomProfilePhotoSize.girl(size: CustomProfilePhotoSizeEnum.l);
    }

    return CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.l);
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
            type: CustomProfilePhotoBtcType.pencil,
            onPressed: () {
              /// TODO: 프로필 관리로 이동
            },
          ),
        ),
      ],
    );
  }
}
