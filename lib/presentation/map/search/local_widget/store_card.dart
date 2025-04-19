part of '../search_store_view.dart';

class _StoreCard extends ConsumerWidget {
  const _StoreCard({required this.store});
  final StoreByLocationModel store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(2.86),
                child: CachedNetworkImage(
                  imageUrl: store.storeImage ?? '',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      store.name,
                      style: textTheme.titleSmall?.copyWith(
                        color: ScaleColorConfig.primary20,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Assets.icon.map.a14x14AddressLine.svg(
                          colorFilter: const ColorFilter.mode(
                            ScaleColorConfig.neutral30,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            store.address,
                            style: textTheme.labelMedium?.copyWith(
                              color: ScaleColorConfig.neutral30,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox.square(
                dimension: 40,
                child: Center(
                  child: Assets.icon.arrow.rightLine.svg(
                    colorFilter: const ColorFilter.mode(
                      ScaleColorConfig.neutral40,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(thickness: 1, height: 1, color: colorScheme.outlineVariant),
      ],
    );
  }
}
