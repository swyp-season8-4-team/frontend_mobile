import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/update_user_store_list_query_param.g.dart';

@JsonSerializable()
class UpdateUserStoreListQueryParam {
  const UpdateUserStoreListQueryParam({
    required this.newName,
    required this.newIconColorId,
  });
  final String newName;
  final int newIconColorId;

  Map<String, dynamic> toJson() => _$UpdateUserStoreListQueryParamToJson(this);
}
