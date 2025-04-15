part of '../store_detail_view.dart';

class _StoreRepresentiveInfo extends ConsumerWidget {
  const _StoreRepresentiveInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorSceheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;

    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);
    final StoreDetailModel storeDetail = state.storeDetail!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorSceheme.outlineVariant)),
      ),
      child: Column(
        children: <Widget>[
          Text(
            storeDetail.name,
            style: textTheme.titleLarge?.copyWith(
              color: const Color(0xFF393939),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            storeDetail.tags.join(' | '),
            style: textTheme.labelSmall?.copyWith(
              color: const Color(0xFF6F6F6F),
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 164 * size.width / 328,
            child: CustomHexagonGrid(
              hexagons: <CustomHexagon>[
                ..._normalizeToLength3<StoreTopPreferenceModel>(
                  storeDetail.topPreferences,
                ).map(
                  (StoreTopPreferenceModel? e) =>
                      CustomHexagon(text: e?.name ?? ''),
                ),
                ..._normalizeToLength3<String>(storeDetail.storeImages).map((
                  String? e,
                ) {
                  if (e != null) {
                    return CustomHexagon(imageUrl: e);
                  }

                  return const CustomHexagon(text: '');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<T?> _normalizeToLength3<T>(List<T>? input) {
    if (input == null || input.isEmpty) {
      return List<T?>.filled(3, null);
    } else if (input.length == 1) {
      return <T?>[input[0], input[0], input[0]];
    } else if (input.length == 2) {
      return <T?>[input[0], input[1], input[0]];
    } else {
      return input.sublist(0, 3);
    }
  }
}
