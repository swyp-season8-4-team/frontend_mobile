import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Photo Card
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=404-39738&m=dev

// Photo Card에 표시될 image의 source
enum PhotoCardSource { file, network }

class CustomPhotoCard extends StatefulWidget {
  const CustomPhotoCard.file({
    required this.file,
    required this.onRemove,
    super.key,
  }) : source = PhotoCardSource.file,
       imageUrl = null;
  const CustomPhotoCard.network({
    required this.imageUrl,
    required this.onRemove,
    super.key,
  }) : source = PhotoCardSource.network,
       file = null;
  final PhotoCardSource source;
  final String? imageUrl;
  final File? file;

  // 이미지 삭제 이벤트 콜백
  final VoidCallback onRemove;

  @override
  State<CustomPhotoCard> createState() => _CustomPhotoCardState();
}

class _CustomPhotoCardState extends State<CustomPhotoCard> {
  bool _removeButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[_buildImage(), _buildRemoveButton()],
    );
  }

  Widget _buildImage() {
    if (widget.source == PhotoCardSource.file) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.10)),
        ),
        child: Image.file(
          widget.file!,
          width: 68,
          height: 68,
          fit: BoxFit.cover,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: widget.imageUrl!,
      imageBuilder: (
        BuildContext context,
        ImageProvider<Object> imageProvider,
      ) {
        return Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.10)),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  Widget _buildRemoveButton() {
    return Positioned(
      top: -6,
      right: -5,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onRemove,
        onTapDown: (_) => _setRemoveButtonPressed(),
        onTapUp: (_) => _unsetRemoveButtonPressed(),
        onTapCancel: _unsetRemoveButtonPressed,
        child: Container(
          decoration: const BoxDecoration(
            // TODO: shadow01 적용 필요
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0x21393939),
                blurRadius: 3,
                offset: Offset(0, 1),
                spreadRadius: 1,
              ),
            ],
          ),
          child:
              _removeButtonPressed
                  ? Assets.icon.etc.a16CloseFilled2.svg()
                  : Assets.icon.etc.a16CloseFilled3.svg(),
        ),
      ),
    );
  }

  void _setRemoveButtonPressed() {
    setState(() {
      _removeButtonPressed = true;
    });
  }

  void _unsetRemoveButtonPressed() {
    setState(() {
      _removeButtonPressed = false;
    });
  }
}
