import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/input_chip.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/search/search.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/design_system/foundation/foundation.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/search/popular_searchs_model.dart';
import 'package:frontend_mobile/domain/model/search/recent_search_model.dart';
import 'package:frontend_mobile/domain/model/store/store_by_location_model.dart';
import 'package:frontend_mobile/presentation/map/search/search_store_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

part 'local_widget/search_keyword_list.dart';
part 'local_widget/store_card.dart';
part 'local_widget/search_result.dart';
part 'local_widget/search_bar.dart';
part 'local_widget/search_result_length.dart';
part 'local_widget/failure.dart';

class SearchStoreView extends ConsumerStatefulWidget {
  const SearchStoreView({super.key});

  @override
  ConsumerState<SearchStoreView> createState() => _SearchStoreViewState();
}

class _SearchStoreViewState extends ConsumerState<SearchStoreView> {
  @override
  Widget build(BuildContext context) {
    final SearchStoreState state = ref.watch(searchStoreViewModelProvider);

    // TODO: 페이지 전환 로딩 UI 구현 필요
    if (state.isFirstPageLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return CustomLoadingOverlay(
      isLoading: state.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(title: '검색', actions: <Widget>[]),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverPinnedToBoxAdapter(child: _SearchBar()),

              if (state.getStoresStatus.isSuccess)
                const SliverPinnedToBoxAdapter(child: _SearchResultLength()),

              if (state.getStoresStatus.isInitial)
                const SliverToBoxAdapter(child: _SearchKeywordList())
              else
                const _SearchResult(),
            ],
          ),
        ),
      ),
    );
  }
}
