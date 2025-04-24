import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_edit.dart';
import 'package:frontend_mobile/common/design_system/component/tag/label_tag.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/global/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/my_page/my_page_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:frontend_mobile/presentation/widget/default_error.dart';
import 'package:frontend_mobile/presentation/widget/desserbee_bottom_navigation.dart';
import 'package:go_router/go_router.dart';

class MyPageView extends ConsumerStatefulWidget {
  const MyPageView({super.key});

  @override
  ConsumerState<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends ConsumerState<MyPageView> {
  final TopBarIcon _topBarIcon = TopBarIcon();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final UserState userState = ref.read(userViewModelProvider);
      await ref
          .read(myPageViewModelProvider.notifier)
          .getUserStoreListAll(userUuid: userState.data.userUuid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final UserState userState = ref.watch(userViewModelProvider);
    final PreferenceState preferences = ref.watch(preferenceViewModelProvider);
    final MyPageState state = ref.watch(myPageViewModelProvider);

    // 유저의 취향
    final List<PreferenceModel> userPreferences =
        preferences.data
            .where(
              (PreferenceModel e) => userState.data.preferences.contains(e.id),
            )
            .toList();

    // TODO: 로딩 UI 개선 필요
    if (userState.status.isLoading ||
        state.getUserStoreListAllStatus.isLoading) {
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
        state.getUserStoreListAllStatus.isFailure) {
      return Scaffold(
        appBar: const CustomSubTopBar(
          title: 'MY',
          actions: <Widget>[],
          leading: SizedBox.shrink(),
        ),
        bottomNavigationBar: const DesserbeeBottomNavigation(),
        body: DefaultError(
          onRetry: () {
            ref.read(userViewModelProvider.notifier).getMe();
            ref
                .read(myPageViewModelProvider.notifier)
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
      bottomNavigationBar: const DesserbeeBottomNavigation(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 76 + 31,
                  color: ScaleColorConfig.neutral100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Assets.image.profileBg.image(
                        height: 76,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child:
                            userState.isMale
                                ? const CustomProfilePhotoEdit.boy()
                                : const CustomProfilePhotoEdit.girl(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: ScaleColorConfig.neutral100,
                border: Border(
                  bottom: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(
                    '프로필 이름',
                    style: textTheme.titleSmall?.copyWith(
                      color: const Color(0xFF393939),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (userPreferences.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      child: Center(
                        child: Wrap(
                          children: <Widget>[
                            ...userPreferences.mapIndexed(
                              (int index, PreferenceModel e) => Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      index == userPreferences.length - 1
                                          ? 0
                                          : 6,
                                ),
                                child: CustomLabelTag(
                                  label: e.preferenceName,
                                  backgroundColor: ScaleColorConfig.neutral70,
                                  color: ScaleColorConfig.neutral30,
                                ),
                              ),
                            ),
                            if (userPreferences.length > 5)
                              _ViewMoreTag(label: '', onTap: () {}),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '내 활동',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.primary20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: _MyActivityMenu(
                          png: Assets.image.bookmark,
                          label: '찜한 가게',
                          count: state.storeAllCount,
                          onTap: () {
                            context.pushNamed(AppRoutes.myUserStoreList.name);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _MenuList(
                title: '고객 지원',
                menus: <_MenuType>[_MenuType(label: '약관 및 정책', onTap: () {})],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 취향 태그 더보기 버튼
class _ViewMoreTag extends StatelessWidget {
  const _ViewMoreTag({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: colorScheme.outline),
          color: ScaleColorConfig.neutral100,
        ),
      ),
    );
  }
}

// 내 활동 메뉴 버튼 UI
class _MyActivityMenu extends StatelessWidget {
  const _MyActivityMenu({
    required this.png,
    required this.label,
    required this.count,
    required this.onTap,
  });
  final AssetGenImage png;
  final String label;
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.outlineVariant),
          color: ScaleColorConfig.neutral100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            SizedBox.square(
              dimension: 24,
              child: png.image(width: 20, height: 20, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: ScaleColorConfig.neutral20,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '$count',
                style: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.success50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuType {
  const _MenuType({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
}

// 메뉴 리스트
class _MenuList extends StatelessWidget {
  const _MenuList({required this.title, required this.menus});
  final String title;
  final List<_MenuType> menus;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
        color: ScaleColorConfig.neutral100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: ScaleColorConfig.surface80,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              title,
              style: textTheme.titleSmall?.copyWith(
                color: ScaleColorConfig.primary20,
              ),
            ),
          ),
          ...menus.map(
            (_MenuType e) => Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      e.label,
                      style: textTheme.bodySmall?.copyWith(
                        color: ScaleColorConfig.primary20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Assets.icon.arrow.rightLine.svg(
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      ScaleColorConfig.neutral40,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
