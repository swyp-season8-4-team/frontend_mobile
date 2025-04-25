import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/fill_button.dart';
import 'package:frontend_mobile/common/design_system/component/button/outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/core/resource/secure_storage/secure_storage.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/presentation/global/login/login_view_model.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:frontend_mobile/presentation/my_page/setting/delete_my_info/delete_my_info_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';

class DeleteMyInfoView extends ConsumerWidget {
  const DeleteMyInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final UserState userState = ref.watch(userViewModelProvider);
    final DeleteMyInfoViewModel viewmodel = ref.read(
      deleteMyInfoViewModelProvider.notifier,
    );
    final DeleteMyInfoState state = ref.watch(deleteMyInfoViewModelProvider);

    ref.listen(
      deleteMyInfoViewModelProvider.select(
        (DeleteMyInfoState state) => state.deleteMyInfoStatus,
      ),
      (_, Status next) async {
        if (next.isSuccess) {
          // 기기 내 토큰 정보 삭제
          await ref.read(secureStorageProvider).delete(key: Constant.tokenInfo);
          ref.read(loginViewModelProvider.notifier).logout();

          if (context.mounted) {
            context.goNamed(AppRoutes.localLogin.name);
          }
        }
      },
    );

    return CustomLoadingOverlay(
      isLoading: state.deleteMyInfoStatus.isLoading,
      child: Scaffold(
        appBar: const CustomSubTopBar(
          title: '탈퇴하기',
          actions: <Widget>[],
          primary: false,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    children: <Widget>[
                      Text(
                        '${userState.data.nickname}님\n디저비를 떠나시나요 ? 너무 아쉬워요..',
                        style: textTheme.titleMedium?.copyWith(
                          color: ScaleColorConfig.primary10,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '계정을 삭제하면 디저비의 모든 활동 정보가 삭제됩니다.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: ScaleColorConfig.neutral40,
                        ),
                      ),
                      Divider(
                        height: 32,
                        thickness: 1,
                        color: colorScheme.outlineVariant,
                      ),
                      Text(
                        '말씀해주신 소중한 의견을 반영하여 더 따뜻한 서비스를 만들어 가도록 노력할게요.\n\n언제나 이 자리에 있으니 언제든지 돌아와 주세요.\n지금까지 함께 여서 진심으로 행복했어요.\n\n안녕히 가세요 🍯',
                        style: textTheme.bodyMedium?.copyWith(
                          color: ScaleColorConfig.neutral40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomOutlineButton.medium(
                        label: '취소',
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomFillButton.medium(
                        label: '계정삭제',
                        backgroundColor: CustomFillButtonColor.olive,
                        onPressed: () {
                          viewmodel.deleteMyInfo();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
