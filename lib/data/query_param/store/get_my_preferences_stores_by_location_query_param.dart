import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_my_preferences_stores_by_location_query_param.g.dart';

@JsonSerializable()
class GetMyPreferencesStoresByLocationQueryParam {
  const GetMyPreferencesStoresByLocationQueryParam({
    required this.latitude,
    required this.longitude,
    required this.radius,
  });
  final double latitude;
  final double longitude;
  final double radius;

  Map<String, dynamic> toJson() =>
      _$GetMyPreferencesStoresByLocationQueryParamToJson(this);
}
