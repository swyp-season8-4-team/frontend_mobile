import 'package:frontend_mobile/data/data_source/remote/store_notice_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/store_notice/store_notice_entity.dart';

class StoreNoticeMockDataSource implements StoreNoticeRemoteDataSource {
  @override
  Future<List<StoreNoticeEntity>> getStoreNotices({
    required String storeUuid,
  }) async {
    return <StoreNoticeEntity>[
      StoreNoticeEntity(
        noticeId: 123,
        tag: 'tag',
        title: '공지 타이틀 1',
        content: '공지 컨텐츠입니다. 공지 컨텐츠입니다.',
        createdAt: DateTime.now(),
      ),
      StoreNoticeEntity(
        noticeId: 456,
        tag: 'tag',
        title: '공지 타이틀 2',
        content: '공지 컨텐츠입니다. 공지 컨텐츠입니다.',
        createdAt: DateTime.now(),
      ),
      StoreNoticeEntity(
        noticeId: 789,
        tag: 'tag',
        title: '공지 타이틀 3',
        content: '공지 컨텐츠입니다. 공지 컨텐츠입니다.',
        createdAt: DateTime.now(),
      ),
    ];
  }
}
