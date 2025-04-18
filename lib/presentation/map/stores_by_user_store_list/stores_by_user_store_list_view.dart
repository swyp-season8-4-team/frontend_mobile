import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/common/design_system/foundation/color/scale_color_config.dart';
import 'package:frontend_mobile/common/gen_asset/assets.gen.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/presentation/map/stores_by_user_store_list/stores_by_user_store_list_view_model.dart';

part 'local_widget/store_card.dart';

class StoresByUserStoreListView extends ConsumerWidget {
  const StoresByUserStoreListView({required this.listId, super.key});
  final int listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Placeholder();
  }
}
