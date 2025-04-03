import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_stores_from_map_query_param.g.dart';

@JsonSerializable()
class GetStoresFromMapQueryParam {
  const GetStoresFromMapQueryParam({
    required this.latitude,
    required this.longitude,
    required this.radius,
    this.preferenceTagIds,
    this.searchKeyword,
  });
  final double latitude;
  final double longitude;
  final double radius;
  final List<int>? preferenceTagIds;
  final String? searchKeyword;

  Map<String, dynamic> toJson() => _$GetStoresFromMapQueryParamToJson(this);
}
