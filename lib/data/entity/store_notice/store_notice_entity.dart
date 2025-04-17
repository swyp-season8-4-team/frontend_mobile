import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/store_notice_entity.g.dart';

@JsonSerializable()
class StoreNoticeEntity {
  const StoreNoticeEntity({
    required this.noticeId,
    required this.tag,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt,
  });

  factory StoreNoticeEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreNoticeEntityFromJson(json);
  final int noticeId;
  final String tag;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
}
