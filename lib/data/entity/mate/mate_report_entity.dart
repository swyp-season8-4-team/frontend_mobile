import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_report_entity.g.dart';

@JsonSerializable()
class MateReportEntity {
  MateReportEntity({this.message = ''});

  factory MateReportEntity.fromJson(Map<String, dynamic> json) =>
      _$MateReportEntityFromJson(json);

  final String message;
}
