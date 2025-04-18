import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/component/top_bar/sub_top_bar.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/domain/model/store_notice/store_notice_model.dart';
import 'package:frontend_mobile/presentation/map/store_detail/notice/store_notice_view_model.dart';
import 'package:intl/intl.dart';

class StoreNoticeDetailView extends ConsumerWidget {
  const StoreNoticeDetailView({required this.noticeId, super.key});
  final int noticeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final StoreNoticeState state = ref.watch(storeNoticeViewModelProvider);
    final StoreNoticeModel storeNotice = state.storeNotices.firstWhere(
      (StoreNoticeModel e) => e.noticeId == noticeId,
    );

    return Scaffold(
      appBar: const CustomSubTopBar(
        title: '',
        primary: false,
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  storeNotice.title,
                  style: textTheme.titleMedium?.copyWith(
                    color: ScaleColorConfig.neutral20,
                  ),
                ),
              ),
              Divider(height: 1, thickness: 1, color: colorScheme.outline),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      '등록일',
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.neutral40,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      DateFormat('yyyy.MM.dd').format(storeNotice.createdAt),
                      style: textTheme.bodyMedium?.copyWith(
                        color: ScaleColorConfig.neutral20,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, thickness: 1, color: colorScheme.outline),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  storeNotice.content,
                  style: textTheme.bodyMedium?.copyWith(
                    color: ScaleColorConfig.neutral20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
