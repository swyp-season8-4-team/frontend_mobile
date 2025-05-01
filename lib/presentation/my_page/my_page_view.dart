import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/navigation_bar/navigation_bar.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_edit.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/component/tag/label_tag.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/global/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/global/user_review/user_review_view_model.dart';
import 'package:frontend_mobile/presentation/global/user_store/user_store_list_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/default_error.dart';
import 'package:frontend_mobile/presentation/widget/desserbee_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

part 'local_widget/profile_info.dart';
part 'local_widget/my_activity.dart';
part 'local_widget/customer_support.dart';

class MyPageView extends ConsumerStatefulWidget {
  const MyPageView({super.key});

  @override
  ConsumerState<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends ConsumerState<MyPageView> {
  final TopBarIcon _topBarIcon = TopBarIcon();

  // 내 취향 태그 섹션 확장 여부
  bool _isTagExpanded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final UserState userState = ref.read(userViewModelProvider);

      await Future.wait(<Future<void>>[
        ref.read(preferenceViewModelProvider.notifier).getAllPreferences(),
        ref
            .read(userStoreListViewModelProvider.notifier)
            .getUserStoreListAll(userUuid: userState.data.userUuid),
        ref.read(userReviewViewModelProvider.notifier).getMyShortReviews(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserState userState = ref.watch(userViewModelProvider);
    final UserStoreListState userStoreListState = ref.watch(
      userStoreListViewModelProvider,
    );
    final UserReviewState userReviewState = ref.watch(
      userReviewViewModelProvider,
    );

    // TODO: 로딩 UI 개선 필요
    if (userState.status.isLoading ||
        userStoreListState.getUserStoreListAllStatus.isLoading ||
        userReviewState.getMyShortReviewsStatus.isLoading) {
      return const Scaffold(
        appBar: CustomSubTopBar(
          leading: SizedBox.shrink(),
          title: 'MY',
          actions: <Widget>[],
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // TODO: 에러 UI 개선 필요 (현재는 임의로 설정함)
    if (userState.status.isFailure ||
        userStoreListState.getUserStoreListAllStatus.isFailure ||
        userReviewState.getMyShortReviewsStatus.isFailure) {
      return Scaffold(
        appBar: const CustomSubTopBar(
          title: 'MY',
          actions: <Widget>[],
          leading: SizedBox.shrink(),
        ),
        bottomNavigationBar: const DesserbeeBottomNavigation(
          currentItemType: NavigationItemType.my,
        ),
        body: DefaultError(
          onRetry: () {
            ref.read(userViewModelProvider.notifier).getMe();
            ref
                .read(userStoreListViewModelProvider.notifier)
                .getUserStoreListAll(userUuid: userState.data.userUuid);
          },
        ),
      );
    }

    return Scaffold(
      appBar: CustomSubTopBar(
        leading: const SizedBox.shrink(),
        title: 'MY',
        actions: <Widget>[
          _topBarIcon.setting(
            onTap: () {
              context.pushNamed(AppRoutes.myPageSetting.name);
            },
          ),
        ],
      ),
      bottomNavigationBar: const DesserbeeBottomNavigation(
        currentItemType: NavigationItemType.my,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _ProfileInfo(
              isTagExpanded: _isTagExpanded,
              onTagExpandedTap: () {
                setState(() {
                  setState(() {
                    _isTagExpanded = !_isTagExpanded;
                  });
                });
              },
            ),
            const _MyActivity(),
            const _CustomerSupport(),
          ],
        ),
      ),
    );
  }
}
