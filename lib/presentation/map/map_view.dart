import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/dessert_mate_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/floating_chip.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/map_icon_button.dart';
import 'package:frontend_mobile/common/design_system/component/etc/marker/default_marker.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/main_top_bar.dart';
import 'package:frontend_mobile/core/manager/geolocation/geo_location_service_impl.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/widget/scaffold_with_navigation_bar.dart';
import 'package:geolocator/geolocator.dart';

part 'map_view_extensions.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  final double _zoom = 12;

  late final NaverMapController _mapController;

  @override
  Widget build(BuildContext context) {
    final MapState state = ref.watch(mapViewModelProvider);
    final MapViewModel viewmodel = ref.read(mapViewModelProvider.notifier);

    if (state.getAllPreferencesStatus.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    ref.listen(
      mapViewModelProvider.select((MapState state) => state.storesByLocation),
      (_, List<StoreByLocationModel> next) async {
        await _mapController.clearOverlays();

        final List<NMarker> markers = await Future.wait(<Future<NMarker>>[
          ...next.map((StoreByLocationModel e) => _storeToMarker(model: e)),
        ]);

        await _mapController.addOverlayAll(markers.toSet());

        await _setCustomLocationOverlay();
      },
    );

    return ScaffoldWithNavigationBar(
      appBar: const CustomMainTopBar(),
      body: Stack(
        children: <Widget>[
          NaverMap(
            options: NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(
                // TODO: 첫 로딩 시 카메라의 위치를 임의로 강남구로 지정
                target: const NLatLng(37.514575, 127.0495556),
                zoom: _zoom,
              ),
            ),
            onMapReady: (NaverMapController controller) async {
              _mapController = controller;

              await _goToCurrentLocation();

              await _setCustomLocationOverlay();

              setState(() {});
            },
          ),
          Positioned(
            top: 16,
            left: 0,
            child: SizedBox(
              height: 28,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      CustomFloatingChip(
                        label: '내 취향',
                        selected: state.myPreferenceFilterSelected,
                        onPressed: () async {
                          final ({double lat, double lng, double radius})
                          queryOption = await _getQueryOption();

                          viewmodel.updateMyPreferenceFilter(
                            lat: queryOption.lat,
                            lng: queryOption.lng,
                            radius: queryOption.radius,
                          );
                        },
                      ),
                      ...state.preferences.mapIndexed(
                        (int index, PreferenceModel e) => Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: CustomFloatingChip(
                            label: e.preferenceName,
                            selected: state.preferenceTagIds.contains(e.id),
                            onPressed: () async {
                              final ({double lat, double lng, double radius})
                              queryOption = await _getQueryOption();
                              viewmodel.updatePreferenceFilter(
                                lat: queryOption.lat,
                                lng: queryOption.lng,
                                radius: queryOption.radius,
                                preference: e,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 56,
            left: 16,
            child: CustomDessertMateButton(onPressed: () {}),
          ),
          Positioned(
            top: 56,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (!state.myPreferenceFilterSelected &&
                    state.preferenceTagIds.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustomMapIconButton.filterReset(
                      onPressed: () async {
                        final ({double lat, double lng, double radius})
                        queryOption = await _getQueryOption();
                        viewmodel.clearAllFilter(
                          lng: queryOption.lng,
                          lat: queryOption.lat,
                          radius: queryOption.lng,
                        );
                      },
                    ),
                  ),
                CustomMapIconButton.saveStore(
                  isSelected: true,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                CustomMapIconButton.myLocation(
                  isSelected: false,
                  onPressed: () {
                    _goToCurrentLocation();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
