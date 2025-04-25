import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

enum CustomProfilePhotoSizeEnum { xl, l, m, s, xs, xxs }

class CustomProfilePhotoSize extends StatelessWidget {
  CustomProfilePhotoSize.girl({
    this.size = CustomProfilePhotoSizeEnum.xl,
    this.imageUrl,
    super.key,
  }) : image = Assets.image.profileGirl.image();

  CustomProfilePhotoSize.boy({
    this.size = CustomProfilePhotoSizeEnum.xl,
    this.imageUrl,
    super.key,
  }) : image = Assets.image.profileBoy.image();

  final Image image;
  final CustomProfilePhotoSizeEnum size;
  final String? imageUrl;

  double get _size {
    switch (size) {
      case CustomProfilePhotoSizeEnum.xl:
        return imageUrl != null ? 90 : 52;

      case CustomProfilePhotoSizeEnum.l:
        return imageUrl != null ? 62 : 36;

      case CustomProfilePhotoSizeEnum.m:
        return imageUrl != null ? 32 : 20;

      case CustomProfilePhotoSizeEnum.s:
        return imageUrl != null ? 24 : 16;

      case CustomProfilePhotoSizeEnum.xs:
        return imageUrl != null ? 20 : 12;

      case CustomProfilePhotoSizeEnum.xxs:
        return imageUrl != null ? 16 : 10;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case CustomProfilePhotoSizeEnum.xl:
        return EdgeInsets.all(imageUrl != null ? 0 : 19);

      case CustomProfilePhotoSizeEnum.l:
        return EdgeInsets.all(imageUrl != null ? 0 : 13);

      case CustomProfilePhotoSizeEnum.m:
        return EdgeInsets.all(imageUrl != null ? 0 : 6);

      case CustomProfilePhotoSizeEnum.s:
        return EdgeInsets.all(imageUrl != null ? 0 : 4);

      case CustomProfilePhotoSizeEnum.xs:
        return EdgeInsets.all(imageUrl != null ? 0 : 4);

      case CustomProfilePhotoSizeEnum.xxs:
        return EdgeInsets.all(imageUrl != null ? 0 : 3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: null,
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
        minimumSize: Size.zero,
        padding: _padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        backgroundColor: const Color(0xFFDFDFDF),
      ),
      child: SizedBox(width: _size, child: getImageFromUrl() ?? image),
    );
  }

  Widget? getImageFromUrl() {
    if (imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        width: _size,
        height: _size,
        errorWidget: (_, __, ___) {
          return SizedBox.square(
            dimension: _size,
            child: const Icon(Icons.error),
          );
        },
      );
    }
    return null;
  }
}
