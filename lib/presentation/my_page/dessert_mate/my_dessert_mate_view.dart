import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/badge/number_badge.dart';
import 'package:frontend_mobile/common/design_system/component/chip/suggestive_chip.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/presentation/dessert/widget/list/dessert_list_card.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/my_page/dessert_mate/my_dessert_mate_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/default_error.dart';
import 'package:go_router/go_router.dart';

part 'local_widget/saved_mate.dart';
part 'local_widget/approved_mate.dart';
part 'local_widget/my_mate.dart';
part 'local_widget/tab_bar.dart';

class MyDessertMateView extends ConsumerStatefulWidget {
  const MyDessertMateView({super.key});

  @override
  ConsumerState<MyDessertMateView> createState() => _MyDessertMateViewState();
}

class _MyDessertMateViewState extends ConsumerState<MyDessertMateView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabListener);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(myDessertMateViewModelProvider.notifier).getMate();
    });
  }

  void _tabListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final UserState userState = ref.watch(userViewModelProvider);
    final MyDessertMateState state = ref.watch(myDessertMateViewModelProvider);
    final MyDessertMateViewModel viewmodel = ref.read(
      myDessertMateViewModelProvider.notifier,
    );

    if (state.getMyMateStatus.isLoading) {
      return const Scaffold(
        appBar: CustomSubTopBar(
          title: '디저트 메이트',
          actions: <Widget>[],
          primary: false,
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.getMyMateStatus.isFailure) {
      return Scaffold(
        appBar: const CustomSubTopBar(
          title: '디저트 메이트',
          actions: <Widget>[],
          primary: false,
        ),
        body: DefaultError(
          onRetry: () {
            viewmodel.getMate();
          },
        ),
      );
    }

    return Scaffold(
      appBar: const CustomSubTopBar(
        title: '디저트 메이트',
        actions: <Widget>[],
        primary: false,
      ),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
                sliver: SliverPersistentHeader(
                  pinned: true,
                  // TODO: CustomTab을 사용해야 하는데, 약간 달라서 별도의 컴포넌트를 구현하였음
                  delegate: _TabBarDelegate(
                    userUuid: userState.data.userUuid,
                    tabController: _tabController,
                    mate: state.data,
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                _SavedMate(),
                _ApprovedMate(),
                _MyMate(),
              ],
            ),
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
