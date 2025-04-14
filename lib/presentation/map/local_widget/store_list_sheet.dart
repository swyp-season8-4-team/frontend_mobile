part of '../map_view.dart';

class _StoreListSheet extends StatelessWidget {
  const _StoreListSheet({
    required this.draggableScrollableController,
    required this.snapSize,
    required this.isStoreListAppBarVisible,
  });
  final DraggableScrollableController draggableScrollableController;
  final double snapSize;
  final bool isStoreListAppBarVisible;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Positioned.fill(
      child: DraggableScrollableSheet(
        controller: draggableScrollableController,
        minChildSize: 0,
        initialChildSize: 0,
        snap: true,
        expand: false,
        snapSizes: <double>[snapSize],
        builder: (BuildContext context, ScrollController scrollController) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft:
                      isStoreListAppBarVisible
                          ? Radius.zero
                          : const Radius.circular(28),
                  topRight:
                      isStoreListAppBarVisible
                          ? Radius.zero
                          : const Radius.circular(28),
                ),
                color: ScaleColorConfig.white,
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  isStoreListAppBarVisible
                      ? const SliverToBoxAdapter(child: SizedBox.shrink())
                      : SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          alignment: Alignment.center,
                          child: Container(
                            width: 32,
                            height: 4,
                            decoration: BoxDecoration(
                              color: ScaleColorConfig.neutral30,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 6,
                        right: 16,
                        left: 16,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '전체 리스트',
                            style: textTheme.titleMedium?.copyWith(
                              color: ScaleColorConfig.primary20,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '9',
                            style: textTheme.titleMedium?.copyWith(
                              color: ScaleColorConfig.success50,
                            ),
                          ),
                          const Spacer(),
                          CustomOutlineButton.xSmall(
                            label: '새 리스트 추가',
                            onPressed: () {},
                            svg: Assets.icon.system.addCircleLine,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      List<Widget>.generate(20, (int index) {
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: CustomSavedStoreListItem.withOptionMenus(
                                leftIconColor: Colors.red,
                                name: '디저트 가게 모음 $index',
                                storeLength: 4,
                                optionMenus: const <CustomOptionMenu>[],
                                optionMenusVisible: false,
                                onOptionMenusTap: () {},
                                onTap: () {},
                              ),
                            ),
                            const Divider(color: ScaleColorConfig.neutral50),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
