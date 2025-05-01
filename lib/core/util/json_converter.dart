import 'package:freezed_annotation/freezed_annotation.dart';

/// Json Converter 정의 용도

/// UTC Time을 위한 Json Converter
class DateTimeJsonConverter extends JsonConverter<DateTime, String?> {
  const DateTimeJsonConverter();

  @override
  DateTime fromJson(String? json) {
    return json == null ? DateTime(1970) : DateTime.parse(json).toLocal();
  }

  @override
  String? toJson(DateTime object) => object.toUtc().toIso8601String();
}
