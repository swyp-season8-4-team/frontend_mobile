import 'package:json_annotation/json_annotation.dart';

part 'generated/kakao_request_body.g.dart';

@JsonSerializable()
class KakaoRequestBody {
  KakaoRequestBody({required this.code, required this.provider});

  final String code;
  final String provider;

  Map<String, dynamic> toJson() => _$KakaoRequestBodyToJson(this);
}
