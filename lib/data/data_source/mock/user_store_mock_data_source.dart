import 'package:frontend_mobile/data/data_source/remote/user_store_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_summary_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_location_entity.dart';
import 'package:frontend_mobile/data/query_param/user_store/add_user_store_list_query_param.dart';
import 'package:frontend_mobile/data/query_param/user_store/update_user_store_list_query_param.dart';

class UserStoreMockDataSource implements UserStoreRemoteDataSource {
  List<UserStoreListEntity> lists = <UserStoreListEntity>[
    const UserStoreListEntity(
      listId: 2423,
      userUuid: '123',
      listName: '리스트 이름 1',
      iconColorId: 2,
      storeCount: 12,
      storeData: <UserStoreDataEntity>[
        UserStoreDataEntity(
          userUuid: '123',
          storeUuid: '123',
          listId: 2423,
          listName: '리스트 이름 1',
          storeName: '가게 이름 1',
          storeAddress: '서울시 강남구 역삼동',
          latitude: 37.514575,
          longitude: 127.0495556,
          imageUrls: <String>['https://picsum.photos/250?image=5'],
        ),
        UserStoreDataEntity(
          userUuid: '123',
          storeUuid: '456',
          listId: 2423,
          listName: '리스트 이름 1',
          storeName: '가게 이름 2',
          storeAddress: '서울시 강남구 역삼동',
          latitude: 37.514575,
          longitude: 127.0495556,
          imageUrls: <String>['https://picsum.photos/250?image=5'],
        ),
      ],
    ),
    const UserStoreListEntity(
      listId: 2434,
      userUuid: '123',
      listName: '리스트 이름 2',
      iconColorId: 3,
      storeCount: 12,
      storeData: <UserStoreDataEntity>[
        UserStoreDataEntity(
          userUuid: '123',
          storeUuid: '1234',
          listId: 2434,
          listName: '리스트 이름 1',
          storeName: '가게 이름 1',
          storeAddress: '서울시 강남구 역삼동',
          latitude: 37.524575,
          longitude: 127.0695556,
          imageUrls: <String>['https://picsum.photos/250?image=5'],
        ),
        UserStoreDataEntity(
          userUuid: '123',
          storeUuid: '4565',
          listId: 2423,
          listName: '리스트 이름 1',
          storeName: '가게 이름 2',
          storeAddress: '서울시 강남구 역삼동',
          latitude: 37.514575,
          longitude: 127.0495556,
          imageUrls: <String>['https://picsum.photos/250?image=5'],
        ),
      ],
    ),
  ];

  List<UserStoreDataEntity> stores = <UserStoreDataEntity>[
    const UserStoreDataEntity(
      userUuid: '123',
      storeUuid: '1',
      listId: 123,
      listName: '리스트 이름 1',
      storeName: '가게 이름 1',
      storeAddress: '서울시 강남구 역삼동',
      latitude: 37,
      longitude: 127,
      imageUrls: <String>['https://picsum.photos/250?image=5'],
    ),
    const UserStoreDataEntity(
      userUuid: '123',
      storeUuid: '2',
      listId: 123,
      listName: '리스트 이름 1',
      storeName: '가게 이름 1',
      storeAddress: '서울시 강남구 역삼동',
      latitude: 37,
      longitude: 127,
      userPreferences: <int>[3, 7, 8],
      imageUrls: <String>['https://picsum.photos/250?image=6'],
    ),
    const UserStoreDataEntity(
      userUuid: '123',
      storeUuid: '3',
      listId: 123,
      listName: '리스트 이름 1',
      storeName: '가게 이름 1',
      storeAddress: '서울시 강남구 역삼동',
      latitude: 37,
      longitude: 127,
      imageUrls: <String>['https://picsum.photos/250?image=7'],
    ),
    const UserStoreDataEntity(
      userUuid: '123',
      storeUuid: '4',
      listId: 123,
      listName: '리스트 이름 1',
      storeName: '가게 이름 1',
      storeAddress: '서울시 강남구 역삼동',
      latitude: 37,
      longitude: 127,
      imageUrls: <String>['https://picsum.photos/250?image=9'],
    ),
    const UserStoreDataEntity(
      userUuid: '123',
      storeUuid: '5',
      listId: 123,
      listName: '리스트 이름 1',
      storeName: '가게 이름 1',
      storeAddress: '서울시 강남구 역삼동',
      latitude: 37,
      longitude: 127,
      imageUrls: <String>['https://picsum.photos/250?image=8'],
    ),
  ];

  @override
  Future<void> addStoreToUserStoreList({
    required int listId,
    required String storeUuid,
    required List<int> preferenceIds,
  }) {
    return Future<void>.value();
  }

  @override
  Future<void> addUserStoreList({
    required String userUuid,
    required AddUserStoreListQueryParam query,
  }) {
    return Future<void>.value();
  }

  @override
  Future<void> deleteStoreFromUserStoreList({
    required int listId,
    required String storeUuid,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    stores =
        stores
            .where((UserStoreDataEntity e) => e.storeUuid != storeUuid)
            .toList();
  }

  @override
  Future<void> deleteUserStoreList({required int listId}) async {
    await Future<void>.delayed(const Duration(seconds: 2));
    lists = lists.where((UserStoreListEntity e) => e.listId != listId).toList();
  }

  @override
  Future<UserStoreListEntity> getStoresByUserStoreList({
    required int listId,
  }) async {
    return UserStoreListEntity(
      listId: listId,
      userUuid: '123',
      listName: '리스트 이름 1',
      iconColorId: 2,
      storeCount: 2,
      storeData: stores,
    );
  }

  @override
  Future<List<UserStoreListEntity>> getUserStoreListAll({
    required String userUuid,
  }) async {
    return lists;
  }

  @override
  Future<UserStoreListSummaryEntity> getUserStoreListSummary({
    required int listId,
  }) {
    // TODO: implement getUserStoreListSummary
    throw UnimplementedError();
  }

  @override
  Future<List<UserStoreLocationEntity>> getUserStoreLocations({
    required int listId,
  }) {
    // TODO: implement getUserStoreLocations
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserStoreList({
    required int listId,
    required UpdateUserStoreListQueryParam query,
  }) {
    // TODO: implement updateUserStoreList
    throw UnimplementedError();
  }
}
