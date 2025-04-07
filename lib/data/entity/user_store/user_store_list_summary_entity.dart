import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_store_list_summary_entity.g.dart';

@JsonSerializable()
class UserStoreListSummaryEntity {
  const UserStoreListSummaryEntity({
    required this.listId,
    required this.listName,
    required this.iconColorId,
  });

  factory UserStoreListSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStoreListSummaryEntityFromJson(json);

  final int listId;
  final String listName;
  final int iconColorId;
}
