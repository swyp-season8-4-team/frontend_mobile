import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/dialog/dialog.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar.dart';
import 'package:frontend_mobile/common/design_system/component/snackbar/snack_bar_right_item.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/resource/top_bar_icon.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/manager/toast/toast_manager.dart';
import 'package:frontend_mobile/core/resource/extension.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/core/util/loading/loading_overlay.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/get_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/pending_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/presentation/dessert/comment/dessert_comment_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/dessert_post_view_model.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/header/info/dessert_post_header_info.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/host/dessert_post_host_approved.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/host/dessert_post_host_pending.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/participant/dessert_post_participant_approved.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/participant/dessert_post_participant_none.dart';
import 'package:frontend_mobile/presentation/dessert/post/widget/participant/dessert_post_participant_pending.dart';
import 'package:frontend_mobile/presentation/global/user/user_view_model.dart';
import 'package:go_router/go_router.dart';

class DessertPost extends ConsumerStatefulWidget {
  const DessertPost({required this.mateUuid, super.key});

  final String mateUuid;

  @override
  ConsumerState<DessertPost> createState() => _DessertPostState();
}

class _DessertPostState extends ConsumerState<DessertPost> {
  bool isOptionActive = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(dessertPostViewModelProvider.notifier)
          .getMateDetail(
            params: GetMateDetailParams(mateUuid: widget.mateUuid),
          );

      ref
          .read(dessertPostViewModelProvider.notifier)
          .pendingMateMember(
            params: PendingMateMemberParams(mateUuid: widget.mateUuid),
          );

      ref
          .read(dessertPostViewModelProvider.notifier)
          .getMateMember(
            params: GetMateMemberParams(mateUuid: widget.mateUuid),
          );

      ref
          .read(dessertCommentViewModelProvider.notifier)
          .getMateReply(
            params: GetMateReplyParams(mateUuid: widget.mateUuid, to: 1000),
          );
    });
  }

  Widget _contentsImage() {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CachedNetworkImage(
      placeholder: (BuildContext context, String url) {
        return Container(color: ScaleColorConfig.neutral70);
      },
      imageUrl: state.data.mateImage,
      errorWidget: (_, __, ___) {
        return Container(
          color: ScaleColorConfig.neutral60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Assets.icon.file.noImageStatus.svg(
                colorFilter: const ColorFilter.mode(
                  ScaleColorConfig.neutral40,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                'No Image',
                style: textTheme.labelSmall?.copyWith(
                  color: ScaleColorConfig.neutral40,
                ),
              ),
            ],
          ),
        );
      },
      fit: BoxFit.cover,
    );
  }

  Widget _contentsFooter() {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final DessertCommentState commentState = ref.watch(
      dessertCommentViewModelProvider,
    );
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        if (state.data.applyStatus != 'APPROVED')
          Row(
            children: <Widget>[
              Assets.icon.contact.message1Line.svg(
                width: 16,
                colorFilter: const ColorFilter.mode(
                  ScaleColorConfig.neutral50,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                commentState.data.count.toString(),
                style: textTheme.labelLarge?.copyWith(
                  color: ScaleColorConfig.neutral50,
                ),
              ),
            ],
          ),

        if (state.data.createdAt.isNotEmpty) ...<Widget>[
          const Spacer(),
          Text(
            state.data.createdAt.toDate(),
            style: textTheme.labelLarge?.copyWith(
              color: ScaleColorConfig.neutral50,
            ),
          ),
        ],
      ],
    );
  }

  void _optionHandler() {
    setState(() {
      isOptionActive = !isOptionActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DessertPostState state = ref.watch(dessertPostViewModelProvider);
    final ToastManager toastManager = ref.read(toastManagerProvider);
    final UserState userState = ref.read(userViewModelProvider);

    ref.listen(dessertPostViewModelProvider, (_, DessertPostState next) {
      final ToastManager toastManager = ref.read(toastManagerProvider);

      switch (next.postMateStatus) {
        case Status.success:
          toastManager.show(
            context: context,
            aboveBottomNavigation: true,
            toastWidget: CustomSnackBar(
              description: '참여요청이 완료되었습니다',
              actionButton: SnackBarActionButton(onTap: () {}, label: '확인'),
            ),
          );
          break;

        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.pop(),
                ),
              );
            },
          );
          break;

        default:
      }

      switch (next.deleteMateStatus) {
        case Status.success:
          toastManager.show(
            context: context,
            aboveBottomNavigation: true,
            toastWidget: CustomSnackBar(
              description: '참여요청을 취소했습니다',
              actionButton: SnackBarActionButton(onTap: () {}, label: '확인'),
            ),
          );
          break;

        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.pop(),
                ),
              );
            },
          );
          break;

        default:
      }

      switch (next.acceptMateStatus) {
        case Status.failure:
          toastManager.show(
            context: context,
            toastWidget: CustomSnackBar(
              description: '모든 정원이 다 채워졌어요',
              actionButton: SnackBarActionButton(onTap: () {}, label: '확인'),
            ),
          );
          break;

        default:
      }

      switch (next.postBlockUserStatus) {
        case Status.success:
          while (context.canPop()) {
            context.pop();
          }
          break;

        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.pop(),
                ),
              );
            },
          );
          break;

        default:
      }
    });

    ref.listen(dessertCommentViewModelProvider, (_, DessertCommentState next) {
      switch (next.postBlockUserStatus) {
        case Status.success:
          toastManager.show(
            context: context,
            aboveBottomNavigation: true,
            toastWidget: CustomSnackBar(
              description: '${next.blockedUserNickname}님을 차단했습니다.',
              actionButton: SnackBarActionButton(onTap: () {}, label: '확인'),
            ),
          );
          break;

        case Status.failure:
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog.basic(
                description: next.exception.message,
                primaryButton: CustomDialogButton(
                  text: '확인',
                  onTap: () => context.pop(),
                ),
              );
            },
          );
          break;

        default:
      }
    });

    return Listener(
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          isOptionActive = false;
        });
      },
      child: CustomLoadingOverlay(
        isLoading: state.postMateStatus.isLoading,
        child: Scaffold(
          appBar: CustomSubTopBar(
            title: '',
            actions: TopBarIcon.toList(<Widget>[]),
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: DessertPostHeaderInfo(
                            isOptionActive: isOptionActive,
                            optionHandler: _optionHandler,
                          ),
                        ),

                        // if (state.data.place?.placeName != null)
                        //   Container(
                        //     padding: const EdgeInsets.symmetric(
                        //       vertical: 8,
                        //       horizontal: 16,
                        //     ),
                        //     decoration: const BoxDecoration(
                        //       border: Border(
                        //         top: BorderSide(
                        //           color: ScaleColorConfig.neutral70,
                        //         ),
                        //         bottom: BorderSide(
                        //           color: ScaleColorConfig.neutral70,
                        //         ),
                        //       ),
                        //     ),
                        //     child: const DessertPostHeaderLocation(),
                        //   ),

                        /// 콘텐츠에 이미지가 있는경우
                        if (state.data.mateImage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: _contentsImage(),
                          ),

                        /// 콘텐츠 텍스트
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(state.data.content),
                        ),

                        /// 댓글수, 작성 시간
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: const BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: ScaleColorConfig.surface80,
                              ),
                            ),
                          ),
                          child: _contentsFooter(),
                        ),

                        /// 모임장인 경우
                        if (userState.data.userUuid == state.data.userUuid)
                          const Column(
                            children: <Widget>[
                              DessertPostHostPending(),
                              DessertPostHostApproved(),
                            ],
                          ),

                        /// 참가자가 승인된 경우
                        if (state.data.applyStatus == 'APPROVED')
                          DessertPostParticipantApproved(
                            mateUuid: widget.mateUuid,
                          ),
                      ],
                    ),
                  ),
                ),

                /// 참가자가 신청 안한 경우
                if (state.data.applyStatus == 'NONE')
                  const DessertPostParticipantNone(),

                /// 참가자가 신청해서 기다리는 중인 경우
                if (state.data.applyStatus == 'PENDING')
                  const DessertPostParticipantPending(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
