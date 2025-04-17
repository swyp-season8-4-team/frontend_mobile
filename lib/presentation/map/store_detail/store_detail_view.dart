import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/badge/number_badge.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
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
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'local_widget/owner_pick_image.dart';
part 'local_widget/store_representive_info.dart';
part 'local_widget/store_detail_info.dart';
part 'local_widget/introduce.dart';
part 'local_widget/notice.dart';

class StoreDetailView extends ConsumerStatefulWidget {
  const StoreDetailView({required this.storeUuid, super.key});
  final String storeUuid;

  @override
  ConsumerState<StoreDetailView> createState() => _StoreDetailViewState();
}

class _StoreDetailViewState extends ConsumerState<StoreDetailView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

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
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // TODO: 페이지 에러 UI 구현 필요
    if (state.getStoreDetailStatus.isFailure) {
      return Scaffold(
        body: Center(child: Text(state.getStoreDetailException.code)),
      );
    }

    return Scaffold(
      appBar: const CustomSubTopBar(title: '', actions: <Widget>[]),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverToBoxAdapter(child: _OwnerPickImage()),
            const SliverToBoxAdapter(child: _StoreRepresentiveInfo()),
            const SliverToBoxAdapter(child: _StoreDetailInfo()),
            const SliverToBoxAdapter(child: _Introduce()),
            const SliverToBoxAdapter(child: _RecentNotice()),
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                storeDetail: state.storeDetail!,
                tabController: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            Center(child: Text('1')),
            Center(child: Text('2')),
            Center(child: Text('3')),
          ],
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

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  const _TabBarDelegate({
    required this.storeDetail,
    required this.tabController,
  });

  final StoreDetailModel storeDetail;
  final TabController tabController;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ScaleColorConfig.surface70)),
      ),
      child: TabBar(
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
          color: ScaleColorConfig.surface90,
          border: Border(
            bottom: BorderSide(color: ScaleColorConfig.primary70, width: 2.5),
          ),
        ),
        dividerColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        labelStyle: textTheme.labelLarge?.copyWith(
          color: ScaleColorConfig.neutral30,
        ),
        unselectedLabelStyle: textTheme.labelLarge?.copyWith(
          color: ScaleColorConfig.neutral30,
        ),
        overlayColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
          return Colors.transparent;
        }),
        tabs: <Widget>[
          _tab(
            context: context,
            label: '메뉴',
            index: 0,
            count: storeDetail.menus.length,
          ),
          _tab(
            context: context,
            label: '사진',
            index: 1,
            count: storeDetail.storeImages?.length ?? 0,
          ),
          _tab(context: context, label: '디저트메이트', index: 2),
        ],
      ),
    );
  }

  Widget _tab({
    required BuildContext context,
    required int index,
    required String label,
    int? count,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(label),
          if (count != null) ...<Widget>[
            const SizedBox(width: 4),
            tabController.index == index
                ? CustomNumberBadge(number: count, error: false)
                : Text(
                  count >= 1000 ? '999+' : count.toString(),
                  style: textTheme.labelSmall?.copyWith(
                    color: ScaleColorConfig.neutral50,
                  ),
                ),
          ],
        ],
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
