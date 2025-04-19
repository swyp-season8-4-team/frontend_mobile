part of '../store_notice_view.dart';

class _StoreNoticeCard extends StatelessWidget {
  const _StoreNoticeCard({required this.storeNotice});

  final StoreNoticeModel storeNotice;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                storeNotice.title,
                style: textTheme.titleSmall?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 6),
              Text(
                storeNotice.content,
                style: textTheme.bodySmall?.copyWith(
                  // TODO: 컬러 적용 필요
                  color: const Color(0xFF393939),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                DateFormat('yyyy.MM.dd').format(storeNotice.createdAt),
                style: textTheme.labelMedium?.copyWith(
                  color: ScaleColorConfig.neutral40,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: colorScheme.outline),
      ],
    );
  }
}
