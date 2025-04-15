import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class _StoreDetailViewState extends ConsumerState<StoreDetailView> {
  @override
  void initState() {
    super.initState();
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
          ];
        },
        body: const Column(),
      ),
    );
  }
}
