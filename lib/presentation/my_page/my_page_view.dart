import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_setting.dart';
import 'package:frontend_mobile/common/design_system/component/tag/label_tag.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/global/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/widget/desserbee_bottom_navigation.dart';

class MyPageView extends ConsumerStatefulWidget {
  const MyPageView({super.key});

  @override
  ConsumerState<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends ConsumerState<MyPageView> {
  final TopBarIcon _topBarIcon = TopBarIcon();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final UserState userState = ref.watch(userViewModelProvider);
    final PreferenceState preferences = ref.watch(preferenceViewModelProvider);

    // 유저의 취향
    final List<PreferenceModel> userPreferences =
        preferences.data
            .where(
              (PreferenceModel e) => userState.data.preferences.contains(e.id),
            )
            .toList();

    return Scaffold(
      appBar: CustomSubTopBar(
        leading: const SizedBox.shrink(),
        title: 'MY',
        actions: <Widget>[_topBarIcon.setting(onTap: () {})],
      ),
      bottomNavigationBar: const DesserbeeBottomNavigation(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 76 + 45,
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
                const SizedBox(height: 45),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (userState.isMale)
                        CustomProfilePhotoSetting.boy(
                          onCameraTap: (Uint8List a) {},
                        )
                      else
                        CustomProfilePhotoSetting.girl(
                          onCameraTap: (Uint8List a) {},
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
