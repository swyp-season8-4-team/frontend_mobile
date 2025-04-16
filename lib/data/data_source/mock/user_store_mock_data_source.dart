import 'package:frontend_mobile/data/data_source/remote/user_store_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_summary_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_location_entity.dart';
import 'package:frontend_mobile/data/query_param/user_store/add_user_store_list_query_param.dart';
import 'package:frontend_mobile/data/query_param/user_store/update_user_store_list_query_param.dart';

class UserStoreMockDataSource implements UserStoreRemoteDataSource {
  @override
  Future<void> addStoreToUserStoreList({
    required int listId,
    required String storeUuid,
    required List<int> preferenceIds,
  }) {
    // TODO: implement addStoreToUserStoreList
    throw UnimplementedError();
  }

  @override
  Future<void> addUserStoreList({
    required String userUuid,
    required AddUserStoreListQueryParam query,
  }) {
    // TODO: implement addUserStoreList
    throw UnimplementedError();
  }

  @override
  Future<void> deleteStoreFromUserStoreList({
    required int listId,
    required String storeUuid,
  }) {
    // TODO: implement deleteStoreFromUserStoreList
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUserStoreList({required int listId}) {
    // TODO: implement deleteUserStoreList
    throw UnimplementedError();
  }

  @override
  Future<UserStoreListEntity> getStoresByUserStoreList({required int listId}) {
    // TODO: implement getStoresByUserStoreList
    throw UnimplementedError();
  }

  @override
  Future<List<UserStoreListEntity>> getUserStoreListAll({
    required String userUuid,
  }) async {
    return <UserStoreListEntity>[
      UserStoreListEntity(
        listId: 2423,
        userUuid: '123',
        listName: '리스트 이름 1',
        iconColorId: 2,
        storeCount: 12,
        storeData: <UserStoreDataEntity>[
          UserStoreDataEntity(
            userUuid: userUuid,
            storeUuid: '123',
            listId: 2423,
            listName: '리스트 이름 1',
            storeName: '가게 이름 1',
            storeAddress: '서울시 강남구 역삼동',
            latitude: 37.514575,
            longitude: 127.0495556,
          ),
        ],
      ),
    ];
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
