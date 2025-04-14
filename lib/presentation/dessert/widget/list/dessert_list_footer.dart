import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_size.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';

class DessertListFooter extends StatelessWidget {
  const DessertListFooter({required this.mate, super.key});

  final MateDetailModel mate;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            if (mate.profileImage.isEmpty)
              if (mate.gender == 'FEMALE')
                CustomProfilePhotoSize.girl(
                  size: CustomProfilePhotoSizeEnum.xxs,
                )
              else
                CustomProfilePhotoSize.boy(size: CustomProfilePhotoSizeEnum.xxs)
            else
              Container(
                width: 15,
                height: 15,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),

                /// FIXME: 이미지 에러 처리 필요
                child: CachedNetworkImage(
                  imageUrl: mate.profileImage,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(width: 4),
            Text(
              mate.nickname,
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral30,
              ),
            ),
          ],
        ),
        Text(
          mate.createdAt.toDate(),
          style: textTheme.labelLarge?.copyWith(
            color: ScaleColorConfig.neutral50,
          ),
        ),
      ],
    );
  }
}
