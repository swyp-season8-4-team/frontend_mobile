import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:frontend_mobile/presentation/widget/scaffold_with_navigation_bar.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: NaverMap(onMapReady: (NaverMapController controller) {}),
    );
  }
}
