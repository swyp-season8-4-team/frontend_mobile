import 'package:frontend_mobile/data/entity/store_notice/store_notice_entity.dart';
import 'package:frontend_mobile/domain/model/store_notice/store_notice_model.dart';

extension StoreNoticeEntityExt on StoreNoticeEntity {
  StoreNoticeModel toModel() => StoreNoticeModel(
    noticeId: noticeId,
    tag: tag,
    title: title,
    content: content,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
