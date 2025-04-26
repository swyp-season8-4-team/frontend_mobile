import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frontend_mobile/common/design_system/component/badge/number_badge.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/etc/expandable_text.dart';
import 'package:frontend_mobile/common/design_system/component/hexagon_grid/hexagon_grid.dart';
import 'package:frontend_mobile/common/design_system/component/tag/etc_tag.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/store/store_detail_model.dart';
import 'package:frontend_mobile/domain/model/store/store_operating_hour_model.dart';
import 'package:frontend_mobile/domain/model/store/store_top_preference_model.dart';
import 'package:frontend_mobile/presentation/map/store_detail/store_detail_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/store_review_card.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'local_widget/owner_pick_image.dart';
part 'local_widget/store_representive_info.dart';
part 'local_widget/store_detail_info.dart';
part 'local_widget/introduce.dart';
part 'local_widget/notice.dart';
part 'local_widget/menus.dart';
part 'local_widget/dessert_images.dart';
part 'local_widget/tab_bar.dart';
part 'local_widget/failure.dart';
part 'local_widget/store_reviews.dart';

class StoreDetailView extends ConsumerStatefulWidget {
  const StoreDetailView({required this.storeUuid, super.key});
  final String storeUuid;

  @override
  ConsumerState<StoreDetailView> createState() => _StoreDetailViewState();
}

class _StoreDetailViewState extends ConsumerState<StoreDetailView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool _isTabBarPinned = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(storeDetailViewModelProvider.notifier)
          .getStoreDetail(storeUuid: widget.storeUuid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);

    // TODO: 페이지 전환 로딩 UI 구현 필요
    if (state.getStoreDetailStatus.isLoading) {
      return const Scaffold(
        appBar: CustomSubTopBar(title: '', actions: <Widget>[]),

        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.getStoreDetailStatus.isFailure) {
      return _Failure(storeUuid: widget.storeUuid);
    }

    return Scaffold(
      appBar: CustomSubTopBar(
        primary: !_isTabBarPinned,
        title: _isTabBarPinned ? state.storeDetail!.name : '',
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              context.pushNamed(
                AppRoutes.addStoreToUserStoreList.name,
                pathParameters: <String, String>{
                  'id': state.storeDetail!.storeUuid,
                },
              );
            },
            child: Assets.image.flowerFilled.image(
              width: 24,
              height: 24,
              color: ScaleColorConfig.primary10,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverToBoxAdapter(child: _OwnerPickImage()),
              const SliverToBoxAdapter(child: _StoreRepresentiveInfo()),
              const SliverToBoxAdapter(child: _StoreDetailInfo()),
              const SliverToBoxAdapter(child: _Introduce()),
              const SliverToBoxAdapter(child: _RecentNotice()),

              //고의적으로 _TabBarDelegate가 TabBarView를 덮도록 설정
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  delegate: _TabBarDelegate(
                    storeDetail: state.storeDetail!,
                    tabController: _tabController,
                    thumbnailImageUrls: state.thumbnailImageUrls,
                    onPinnedChanged: (bool isPinned) {
                      if (_isTabBarPinned == isPinned) {
                        return;
                      }
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          _isTabBarPinned = isPinned;
                        });
                      });
                    },
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              _Menus(),
              _StoreReviews(),
              _DessertImages(),
              // TODO: 추후 구현 에정
              // Center(child: Text('디저트 메이트')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
