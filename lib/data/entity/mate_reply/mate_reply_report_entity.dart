import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/mate_reply_report_entity.g.dart';

@JsonSerializable()
class MateReplyReportEntity {
  MateReplyReportEntity({this.message = ''});

  factory MateReplyReportEntity.fromJson(Map<String, dynamic> json) =>
      _$MateReplyReportEntityFromJson(json);

  final String message;
}
