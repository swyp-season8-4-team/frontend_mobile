import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_my_preferences_stores_from_map_query_param.g.dart';

@JsonSerializable()
class GetMyPreferencesStoresFromMapQueryParam {
  const GetMyPreferencesStoresFromMapQueryParam({
    required this.latitude,
    required this.longitude,
    required this.radius,
  });
  final double latitude;
  final double longitude;
  final double radius;

  Map<String, dynamic> toJson() =>
      _$GetMyPreferencesStoresFromMapQueryParamToJson(this);
}
