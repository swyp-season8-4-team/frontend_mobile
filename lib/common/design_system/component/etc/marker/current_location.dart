import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';

/// Current Location
/// https://www.figma.com/design/S1zkOn7DjDJ0b1mcPVJRil/SWYP_%E1%84%8B%E1%85%A2%E1%86%B8_1%E1%84%80%E1%85%B5_%E1%84%83%E1%85%B5%E1%84%8C%E1%85%A5%E1%84%87%E1%85%B5?node-id=40000687-133098&m=dev
class CustomCurrentLocation extends StatelessWidget {
  const CustomCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.icon.map.a50CurrentLocation.svg();
  }
}
