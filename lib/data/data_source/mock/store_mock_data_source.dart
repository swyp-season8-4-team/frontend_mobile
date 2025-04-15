import 'package:frontend_mobile/data/data_source/remote/store_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/store/store_by_location_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_detail_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_operating_hour_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_summary_entity.dart';
import 'package:frontend_mobile/data/entity/store/store_top_preference_entity.dart';
import 'package:frontend_mobile/data/query_param/store/get_my_preferences_stores_by_location_query_param.dart';
import 'package:frontend_mobile/data/query_param/store/get_stores_by_location_query_param.dart';

class StoreMockDataSource implements StoreRemoteDataSource {
  @override
  Future<List<StoreByLocationEntity>> getMyPreferencesStoresByLocation({
    required GetMyPreferencesStoresByLocationQueryParam query,
  }) {
    // TODO: implement getMyPreferencesStoresByLocation
    throw UnimplementedError();
  }

  @override
  Future<StoreDetailEntity> getStoreDetail({required String storeUuid}) async {
    await Future<void>.delayed(const Duration(seconds: 3));

    return StoreDetailEntity(
      storeId: 123,
      storeUuid: storeUuid,
      name: '디저비 가게1',
      tags: <String>['케이크', '디저트', '구움 과자', '건강 디저트'],
      averageRating: 4.5,
      animalYn: true,
      tumblerYn: true,
      topPreferences: <StoreTopPreferenceEntity>[
        const StoreTopPreferenceEntity(tagId: 1, name: '비건', rank: 2),
        const StoreTopPreferenceEntity(tagId: 2, name: '락토프리', rank: 2),
        const StoreTopPreferenceEntity(tagId: 3, name: '글루텐프리', rank: 2),
      ],
      storeImages: <String>[
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
      ],
      ownerPickImages: <String>[
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
      ],
      operatingHours: <StoreOperatingHourEntity>[
        const StoreOperatingHourEntity(
          dayOfWeek: 'MONDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'TUESDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'WEDNESDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'THURSDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'FRIDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'SATURDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: true,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'SUNDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
      ],
      address: '서울시 강남구 역삼동',
      phone: '010-9999-8888',
      ownerId: 123,
      ownerUuid: '',
      latitude: 37.514575,
      longitude: 127.0495556,
      menus: <StoreDetailMenu>[
        const StoreDetailMenu(menuUuid: 'menuuuid1', name: '메뉴1', price: 12000),
        const StoreDetailMenu(menuUuid: 'menuuuid2', name: '메뉴3', price: 8000),
        const StoreDetailMenu(menuUuid: 'menuuuid3', name: '메뉴3', price: 9000),
      ],
      totalReviewCount: 24,
    );
  }

  @override
  Future<StoreSummaryEntity> getStoreSummary({
    required String storeUuid,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));

    return StoreSummaryEntity(
      storeId: 123,
      storeUuid: storeUuid,
      name: '디저비 가게1',
      tags: <String>['케이크', '디저트', '구움 과자', '건강 디저트'],
      averageRating: 4.5,
      animalYn: true,
      tumblerYn: true,
      topPreferences: <StoreTopPreferenceEntity>[
        const StoreTopPreferenceEntity(tagId: 1, name: '비건', rank: 2),
        const StoreTopPreferenceEntity(tagId: 2, name: '락토프리', rank: 2),
        const StoreTopPreferenceEntity(tagId: 3, name: '글루텐프리', rank: 2),
      ],
      storeImages: <String>[
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
        'https://picsum.photos/250?image=5',
      ],
      operatingHours: <StoreOperatingHourEntity>[
        const StoreOperatingHourEntity(
          dayOfWeek: 'MONDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'TUESDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'WEDNESDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'THURSDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'FRIDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'SATURDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: true,
        ),
        const StoreOperatingHourEntity(
          dayOfWeek: 'SUNDAY',
          openingTime: '09:00',
          closingTime: '17:00',
          isClosed: false,
        ),
      ],
      address: '서울시 강남구 역삼동',
      phone: '010-9999-8888',
    );
  }

  @override
  Future<List<StoreByLocationEntity>> getStoresByLocation({
    required GetStoresByLocationQueryParam query,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return <StoreByLocationEntity>[
      const StoreByLocationEntity(
        storeId: 1,
        storeUuid: 'store-uuid-1',
        name: '디저트 가게1',
        address: '서울시 강남구 역삼동 어쩌구저쩌구',
        latitude: 37.514575,
        longitude: 127.0495556,
        operatingHours: <StoreOperatingHourEntity>[],
        shortReviewCount: 2,
        tags: <String>[],
      ),
      const StoreByLocationEntity(
        storeId: 2,
        storeUuid: 'store-uuid-2',
        name: '디저트 가게2',
        address: '서울시 강남구 역삼동 어쩌구저쩌구',
        latitude: 37.614575,
        longitude: 127.1495556,
        operatingHours: <StoreOperatingHourEntity>[],
        shortReviewCount: 2,
        tags: <String>[],
      ),
    ];
  }
}
