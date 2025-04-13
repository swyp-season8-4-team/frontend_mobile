import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

enum CustomProfilePhotoSizeEnum { xl, l, m, s, xs, xxs }

class CustomProfilePhotoSize extends StatelessWidget {
  CustomProfilePhotoSize.girl({
    required this.onPressed,
    this.size = CustomProfilePhotoSizeEnum.xl,
    super.key,
  }) : image = Assets.image.profileGirl.image();

  CustomProfilePhotoSize.boy({
    required this.onPressed,
    this.size = CustomProfilePhotoSizeEnum.xl,
    super.key,
  }) : image = Assets.image.profileBoy.image();

  final Image image;
  final CustomProfilePhotoSizeEnum size;
  final VoidCallback? onPressed;

  double get _size {
    switch (size) {
      case CustomProfilePhotoSizeEnum.xl:
        return 52;

      case CustomProfilePhotoSizeEnum.l:
        return 36;

      case CustomProfilePhotoSizeEnum.m:
        return 20;

      case CustomProfilePhotoSizeEnum.s:
        return 16;

      case CustomProfilePhotoSizeEnum.xs:
        return 12;

      case CustomProfilePhotoSizeEnum.xxs:
        return 10;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case CustomProfilePhotoSizeEnum.xl:
        return const EdgeInsets.all(19);

      case CustomProfilePhotoSizeEnum.l:
        return const EdgeInsets.all(13);

      case CustomProfilePhotoSizeEnum.m:
        return const EdgeInsets.all(6);

      case CustomProfilePhotoSizeEnum.s:
        return const EdgeInsets.all(4);

      case CustomProfilePhotoSizeEnum.xs:
        return const EdgeInsets.all(4);

      case CustomProfilePhotoSizeEnum.xxs:
        return const EdgeInsets.all(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        minimumSize: Size.zero,
        padding: _padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        backgroundColor: const Color(0xFFDFDFDF),
      ),
      child: SizedBox(width: _size, child: image),
    );
  }
}
