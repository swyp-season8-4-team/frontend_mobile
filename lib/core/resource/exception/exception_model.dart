import 'package:json_annotation/json_annotation.dart';

part 'exception_model.g.dart';

@JsonSerializable()
class ExceptionModel {
  /// [Swagger 문서](https://api.desserbee.com/swagger-ui/index.html#/) <br />
  /// 에러 발생시, 아래와 같은 형태로 응답 <br />
  /// {
  ///   "status": 500,
  ///   "code": "A008",
  ///   "message": "개발 로그인 처리 중 오류가 발생했습니다.",
  ///   "timestamp": "2025-03-23T19:23:16.270968368"
  /// }
  const ExceptionModel({
    required this.status,
    required this.code,
    required this.message,
    required this.timestamp,
  });

  factory ExceptionModel.fromJson(Map<String, dynamic> json) =>
      _$ExceptionModelFromJson(json);

  final int status;
  final String code;
  final String message;
  final String timestamp;
}
