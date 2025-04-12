import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

class TasteResult extends StatelessWidget {
  const TasteResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[Assets.image.logoBee.image()]);
  }
}
