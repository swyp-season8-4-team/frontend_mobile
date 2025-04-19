part of '../search_store_view.dart';

class _SearchBar extends ConsumerStatefulWidget {
  const _SearchBar();

  @override
  ConsumerState<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<_SearchBar> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(
      searchStoreViewModelProvider.select(
        (SearchStoreState state) => state.getStoresStatus,
      ),
      (_, Status next) {
        if (next.isSuccess) {
          final SearchStoreState state = ref.read(searchStoreViewModelProvider);
          _textEditingController.text = state.searchKeyword ?? '';
        }
      },
    );

    final SearchStoreState state = ref.watch(searchStoreViewModelProvider);
    final SearchStoreViewModel viewmodel = ref.read(
      searchStoreViewModelProvider.notifier,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: ScaleColorConfig.surface90,
      child: Row(
        children: <Widget>[
          Expanded(
            child: CustomSearch(
              onChanged: (String val) {
                viewmodel.updateSearchKeyword(searchKeyword: val);
              },
              onCloseButtonTap: () {
                viewmodel.updateSearchKeyword(searchKeyword: '');
              },
              onSubmitted: (String val) {},
              controller: _textEditingController,
            ),
          ),
          const SizedBox(width: 10),
          CustomFillButton.small(
            label: '검색',
            width: 74,
            onPressed: () {
              if (state.searchKeyword == null ||
                  state.searchKeyword!.trim().isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog.basic(
                      title: 'Notice',
                      description: '한 글자 이상의 검색어를 입력해주세요',
                      primaryButton: CustomDialogButton(
                        text: '확인',
                        onTap: () {
                          context.pop();
                        },
                      ),
                    );
                  },
                );
                return;
              }

              viewmodel.getStores();
            },
            backgroundColor: CustomFillButtonColor.olive,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
