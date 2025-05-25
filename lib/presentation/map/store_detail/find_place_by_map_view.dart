import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/etc/marker/default_marker.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/presentation/map/store_detail/store_detail_view_model.dart';

class FindPlaceByMapView extends ConsumerStatefulWidget {
  const FindPlaceByMapView({super.key});

  @override
  ConsumerState<FindPlaceByMapView> createState() => _FindPlaceByMapState();
}

class _FindPlaceByMapState extends ConsumerState<FindPlaceByMapView> {
  final double _zoom = 12;

  late final NaverMapController _mapController;

  @override
  Widget build(BuildContext context) {
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);
    final StoreDetailModel storeDetail = state.storeDetail!;

    return Scaffold(
      appBar: const CustomSubTopBar(title: '', actions: <Widget>[]),
      body: NaverMap(
        options: NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
            target: NLatLng(storeDetail.latitude, storeDetail.longitude),
            zoom: _zoom,
          ),
          minZoom: 6,
        ),
        onMapReady: (NaverMapController controller) async {
          _mapController = controller;

          await addMarker();
          setState(() {});
        },
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  Future<void> addMarker() async {
    final StoreDetailModel storeDetail =
        ref.read(storeDetailViewModelProvider).storeDetail!;

    final NOverlayImage markerImage = await NOverlayImage.fromWidget(
      widget: Align(child: CustomDefaultMarker(text: storeDetail.name)),
      size: const Size(108, 75),
      context: context,
    );

    final NMarker marker = NMarker(
      id: storeDetail.storeUuid,
      icon: markerImage,
      position: NLatLng(storeDetail.latitude, storeDetail.longitude),
    );

    await _mapController.addOverlay(marker);
  }
}
