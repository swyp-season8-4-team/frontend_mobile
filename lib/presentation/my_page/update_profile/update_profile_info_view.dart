import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/chip/suggestive_chip.dart';
import 'package:frontend_mobile/common/design_system/component/profile_photo/profile_photo_setting.dart';
import 'package:frontend_mobile/common/design_system/component/textfield/input_box.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/presentation/global/preference/preference_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/my_page/update_profile/update_profile_info_view_model.dart';
import 'package:go_router/go_router.dart';

part 'local_widget/profile_image_and_nickname.dart';
part 'local_widget/preferences.dart';
part 'local_widget/save_button.dart';

class UpdateProfileInfoView extends ConsumerWidget {
  const UpdateProfileInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UpdateProfileInfoState state = ref.watch(
      updateProfileInfoViewModelProvider,
    );

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    ref.listen(
      updateProfileInfoViewModelProvider.select(
        (UpdateProfileInfoState state) => state.updateUserInfoStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          ref.read(userViewModelProvider.notifier).getMe();
          context.pop(true);
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading:
          state.updateUserInfoStatus.isLoading ||
          state.updateProfileImageStatus.isLoading ||
          state.postNicknameStatus.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '프로필 관리',
          actions: <Widget>[],
          primary: false,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const _ProfileImageAndNickname(),
                    Divider(height: 1, color: colorScheme.outline),
                    const _Preferences(),
                  ],
                ),
              ),
              const _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
