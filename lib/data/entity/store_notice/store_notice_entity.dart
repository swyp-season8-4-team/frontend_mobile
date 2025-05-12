import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/util/json_converter.dart';

part 'generated/store_notice_entity.g.dart';

@JsonSerializable()
class StoreNoticeEntity {
  const StoreNoticeEntity({
    required this.createdAt,
    this.noticeId = -1,
    this.tag = '',
    this.title = '',
    this.content = '',
    this.updatedAt,
  });

  factory StoreNoticeEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreNoticeEntityFromJson(json);
  final int noticeId;
  final String tag;
  final String title;
  final String content;
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @DateTimeJsonConverter()
  final DateTime? updatedAt;
}
