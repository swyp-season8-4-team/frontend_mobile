part of '../store_detail_view.dart';

class _OwnerPickImage extends ConsumerWidget {
  const _OwnerPickImage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Case 정리
    // 1. 이미지가 3개 이하인 경우
    // 2. 이미지가 4개 이상 6개 미만인 경우
    // 3. 이미지가 6개인 경우
    // 4. 이미지가 7개 이상인 경우
    final StoreDetailState state = ref.watch(storeDetailViewModelProvider);

    final List<String> imageUrls = state.thumbnailImageUrls;

    if (imageUrls.length <= 3) {
      return Row(
        children: <Widget>[
          ...imageUrls.map(
            (String e) =>
                Expanded(child: _buildImage(context: context, imageUrl: e)),
          ),
        ],
      );
    } else if (imageUrls.length < 6) {
      return Row(
        children: <Widget>[
          ...imageUrls
              .sublist(0, 2)
              .map(
                (String e) =>
                    Expanded(child: _buildImage(context: context, imageUrl: e)),
              ),
          Expanded(
            child: _buildImage(
              context: context,
              imageUrl: imageUrls[2],
              hiddenimageLength: imageUrls.length - 3,
            ),
          ),
        ],
      );
    } else if (imageUrls.length == 6) {
      return Row(
        children: <Widget>[
          ...imageUrls
              .sublist(0, 2)
              .map(
                (String e) =>
                    Expanded(child: _buildImage(context: context, imageUrl: e)),
              ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ...imageUrls
                        .sublist(2, 4)
                        .map(
                          (String e) => Expanded(
                            child: _buildImage(
                              context: context,
                              large: false,
                              imageUrl: e,
                            ),
                          ),
                        ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    ...imageUrls
                        .sublist(4, 6)
                        .map(
                          (String e) => Expanded(
                            child: _buildImage(
                              context: context,
                              imageUrl: e,
                              large: false,
                            ),
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          ...imageUrls
              .sublist(0, 2)
              .map(
                (String e) =>
                    Expanded(child: _buildImage(context: context, imageUrl: e)),
              ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ...imageUrls
                        .sublist(2, 4)
                        .map(
                          (String e) => Expanded(
                            child: _buildImage(
                              context: context,
                              large: false,
                              imageUrl: e,
                            ),
                          ),
                        ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    ...imageUrls
                        .sublist(4, 6)
                        .mapIndexed(
                          (int index, String e) => Expanded(
                            child: _buildImage(
                              context: context,
                              imageUrl: e,
                              large: false,
                              hiddenimageLength:
                                  index == 1 ? imageUrls.length - 6 : null,
                            ),
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildImage({
    required BuildContext context,
    required String imageUrl,
    bool large = true,
    int? hiddenimageLength,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl,
              width: constraints.maxWidth,
              height: constraints.maxWidth,

              fit: BoxFit.cover,
            ),
            if (hiddenimageLength != null)
              Positioned.fill(
                child: Container(
                  color: ScaleColorConfig.neutral0.withAlpha(110),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Assets.icon.file.picLine.svg(
                          width: large ? 24 : 16,
                          height: large ? 24 : 16,
                          colorFilter: const ColorFilter.mode(
                            ScaleColorConfig.neutral100,
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          '+$hiddenimageLength',
                          style:
                              large
                                  ? textTheme.labelLarge?.copyWith(
                                    color: ScaleColorConfig.neutral100,
                                  )
                                  : textTheme.labelSmall?.copyWith(
                                    color: ScaleColorConfig.neutral100,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
