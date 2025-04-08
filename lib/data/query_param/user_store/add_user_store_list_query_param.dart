import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/add_user_store_list_query_param.g.dart';

@JsonSerializable()
class AddUserStoreListQueryParam {
  const AddUserStoreListQueryParam({
    required this.listName,
    required this.iconColorId,
  });

  Map<String, dynamic> toJson() => _$AddUserStoreListQueryParamToJson(this);

  final String listName;
  final int iconColorId;
}
