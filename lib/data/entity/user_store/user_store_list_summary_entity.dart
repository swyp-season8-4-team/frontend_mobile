import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_store_list_summary_entity.g.dart';

@JsonSerializable()
class UserStoreListSummaryEntity {
  const UserStoreListSummaryEntity({
    this.listId = -1,
    this.listName = '',
    this.iconColorId = 1,
  });

  factory UserStoreListSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$UserStoreListSummaryEntityFromJson(json);

  final int listId;
  final String listName;
  final int iconColorId;
}
