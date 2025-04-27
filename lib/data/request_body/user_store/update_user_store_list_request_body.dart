import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/update_user_store_list_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateUserStoreListRequestBody {
  const UpdateUserStoreListRequestBody({required this.selectedLists});
  final List<UpdateUserStoreListSelectedList> selectedLists;

  Map<String, dynamic> toJson() => _$UpdateUserStoreListRequestBodyToJson(this);
}

@JsonSerializable(includeIfNull: false)
class UpdateUserStoreListSelectedList {
  const UpdateUserStoreListSelectedList({
    required this.listId,
    this.userPreferences,
  });
  final int listId;
  final List<int>? userPreferences;

  Map<String, dynamic> toJson() =>
      _$UpdateUserStoreListSelectedListToJson(this);
}
