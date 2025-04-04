import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_user_store_list_summary_entity.g.dart';

@JsonSerializable()
class GetUserStoreListSummaryEntity {
  const GetUserStoreListSummaryEntity({
    required this.listId,
    required this.listName,
    required this.iconColorId,
  });

  factory GetUserStoreListSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$GetUserStoreListSummaryEntityFromJson(json);

  final int listId;
  final String listName;
  final int iconColorId;
}
