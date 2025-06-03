import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/refresh_token_header.g.dart';

@JsonSerializable()
class RefreshTokenHeader {
  RefreshTokenHeader({required this.deviceId});

  final String deviceId;

  Map<String, dynamic> toJson() => _$RefreshTokenHeaderToJson(this);
}
