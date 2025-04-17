class StoreNoticeModel {
  const StoreNoticeModel({
    required this.noticeId,
    required this.tag,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });
  final int noticeId;
  final String tag;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime? updatedAt;
}
