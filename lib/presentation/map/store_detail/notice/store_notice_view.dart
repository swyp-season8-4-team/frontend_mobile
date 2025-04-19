import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/button/pill_outline_button.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/core/resource/status.dart';
import 'package:frontend_mobile/domain/model/store_notice/store_notice_model.dart';
import 'package:frontend_mobile/presentation/map/store_detail/notice/store_notice_view_model.dart';
import 'package:frontend_mobile/presentation/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

part 'local_widget/notice.dart';
part 'local_widget/failure.dart';

class StoreNoticeView extends ConsumerStatefulWidget {
  const StoreNoticeView({required this.storeUuid, super.key});
  final String storeUuid;

  @override
  ConsumerState<StoreNoticeView> createState() => _StoreNoticeViewState();
}

class _StoreNoticeViewState extends ConsumerState<StoreNoticeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(storeNoticeViewModelProvider.notifier)
          .getNotices(storeUuid: widget.storeUuid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final StoreNoticeState state = ref.watch(storeNoticeViewModelProvider);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    const TextStyle baseTextStyle = TextStyle(
      color: Color(0xFF393939),
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.30,
      letterSpacing: -0.21,
    );

    // TODO: 로딩 UI 구현 필요
    if (state.getStoreNoticesStatus.isLoading) {
      return const Scaffold(
        appBar: CustomSubTopBar(
          title: '모든 공지',
          primary: false,
          actions: <Widget>[],
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.getStoreNoticesStatus.isFailure) {
      return _Failure(storeUuid: widget.storeUuid);
    }

    return Scaffold(
      appBar: const CustomSubTopBar(
        title: '모든 공지',
        primary: false,
        actions: <Widget>[],
      ),
      body: SafeArea(
        child:
            state.storeNotices.isEmpty
                ? Center(
                  child: Text(
                    '아직 가게 공지가 없어요!',
                    style: textTheme.titleSmall?.copyWith(
                      color: ScaleColorConfig.neutral20,
                    ),
                  ),
                )
                : CustomScrollView(
                  slivers: <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: <Widget>[
                                const Text('전체', style: baseTextStyle),
                                const SizedBox(width: 5),
                                Text(
                                  '${state.storeNotices.length}',
                                  style: baseTextStyle.copyWith(
                                    color: const Color(0xFF898989),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: colorScheme.outline,
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((
                        BuildContext context,
                        int index,
                      ) {
                        final StoreNoticeModel storeNotice =
                            state.storeNotices[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.storeNoticeDetail.name,
                              pathParameters: <String, String>{
                                'id': widget.storeUuid,
                                'noticeId': storeNotice.noticeId.toString(),
                              },
                            );
                          },
                          child: _StoreNoticeCard(storeNotice: storeNotice),
                        );
                      }, childCount: state.storeNotices.length),
                    ),
                  ],
                ),
      ),
    );
  }
}
