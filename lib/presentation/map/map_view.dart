import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/dessert_mate_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/floating_chip.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/map_icon_button.dart';
import 'package:frontend_mobile/common/design_system/component/etc/map/saved_store_list.dart';
import 'package:frontend_mobile/common/design_system/component/etc/option_menu_dropdown.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/navigation_bar.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/main_top_bar.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/geolocation/geo_location_service_impl.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/map/map_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  final double _zoom = 12;

  late final NaverMapController _mapController;
  late final DraggableScrollableController _draggableScrollableController;

  // draggable scrollable sheet의 snap size
  final double _snapSize = 0.5;

  bool _isStoreListAppbarVisible = false;

  @override
  void initState() {
    super.initState();
    _draggableScrollableController = DraggableScrollableController();
    _draggableScrollableController.addListener(_draggableScrollableListener);
  }

  void _draggableScrollableListener() {
    if (_draggableScrollableController.size >= 0.99) {
      if (!_isStoreListAppbarVisible) {
        setState(() {
          _isStoreListAppbarVisible = true;
        });
      }
    } else {
      if (_isStoreListAppbarVisible) {
        setState(() {
          _isStoreListAppbarVisible = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Viewmodel을 통한 상태관리 필요
    final MapState state = ref.watch(mapViewModelProvider);

    // TODO: 로딩 UI 변경 필요
    if (state.getAllPreferencesStatus.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final TopBarIcon topBarIcon = TopBarIcon();
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar:
          _isStoreListAppbarVisible
              ? CustomSubTopBar(
                title: '찜한 가게',
                primary: false,
                leading: topBarIcon.leftLine(
                  onTap: () {
                    _draggableScrollableController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                actions: <Widget>[
                  topBarIcon.close(
                    onTap: () {
                      _draggableScrollableController.animateTo(
                        _snapSize,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ],
              )
              : const CustomMainTopBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 80,
            child: NaverMap(
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
                      CustomFloatingChip(label: '내 취향', onPressed: () {}),
                      ...state.preferences.mapIndexed(
                        (int index, PreferenceModel e) => Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: CustomFloatingChip(
                            label: e.preferenceName,
                            onPressed: () {},
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
                CustomMapIconButton.saveStore(
                  isSelected: true,
                  onPressed: () async {
                    await _draggableScrollableController.animateTo(
                      _snapSize,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomNavigationBar(
              list: <NavigationBarType>[
                NavigationBarType(
                  svg: Assets.icon.map.mapLine,
                  label: '지도',
                  onTap: () {
                    context.goNamed(AppRoutes.map.name);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: DraggableScrollableSheet(
              controller: _draggableScrollableController,
              minChildSize: 0,
              initialChildSize: 0,
              snap: true,
              expand: false,
              snapSizes: <double>[_snapSize],
              builder: (
                BuildContext context,
                ScrollController scrollController,
              ) {
                return SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft:
                            _isStoreListAppbarVisible
                                ? Radius.zero
                                : const Radius.circular(28),
                        topRight:
                            _isStoreListAppbarVisible
                                ? Radius.zero
                                : const Radius.circular(28),
                      ),
                      color: ScaleColorConfig.white,
                    ),
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: <Widget>[
                        _isStoreListAppbarVisible
                            ? const SliverToBoxAdapter(child: SizedBox.shrink())
                            : SliverToBoxAdapter(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                alignment: Alignment.center,
                                child: Container(
                                  width: 32,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: ScaleColorConfig.neutral30,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ),
                            ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 6,
                              right: 16,
                              left: 16,
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  '전체 리스트',
                                  style: textTheme.titleMedium?.copyWith(
                                    color: ScaleColorConfig.primary20,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '9',
                                  style: textTheme.titleMedium?.copyWith(
                                    color: ScaleColorConfig.success50,
                                  ),
                                ),
                                const Spacer(),
                                CustomOutlineButton.xSmall(
                                  label: '새 리스트 추가',
                                  onPressed: () {},
                                  svg: Assets.icon.system.addCircleLine,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            List<Widget>.generate(20, (int index) {
                              return Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child:
                                        CustomSavedStoreListItem.withOptionMenus(
                                          leftIconColor: Colors.red,
                                          name: '디저트 가게 모음 $index',
                                          storeLength: 4,
                                          optionMenus:
                                              const <CustomOptionMenu>[],
                                          optionMenusVisible: false,
                                          onOptionMenusTap: () {},
                                          onTap: () {},
                                        ),
                                  ),
                                  const Divider(
                                    color: ScaleColorConfig.neutral50,
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToCurrentLocation() async {
    try {
      final Position result =
          await ref.read(geoLocationManagerProvider).getCurrentPosition();

      await _mapController.updateCamera(
        NCameraUpdate.fromCameraPosition(
          NCameraPosition(
            target: NLatLng(result.latitude, result.longitude),
            zoom: _zoom,
          ),
        ),
      );

      // 위치 권한이 허용된 이후
      // 트래킹할 수 있도록 설정
      await _mapController.setLocationTrackingMode(
        NLocationTrackingMode.noFollow,
      );
    } catch (e) {
      return;
    }
  }

  Future<void> _setCustomLocationOverlay() async {
    if (mounted) {
      final NLocationOverlay locationOverlay =
          _mapController.getLocationOverlay();

      // NOverlayImage.fromAssetImage는 svg를 지원하지 않음
      const NOverlayImage locationOverlayImage = NOverlayImage.fromAssetImage(
        'asset/image/current_location.png',
      );

      locationOverlay
        ..setIcon(locationOverlayImage)
        ..setIconSize(const Size.square(50))
        ..setCircleColor(Colors.transparent)
        ..setIsVisible(false)
        ..setIsVisible(true);
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    _draggableScrollableController.dispose();
    super.dispose();
  }
}
