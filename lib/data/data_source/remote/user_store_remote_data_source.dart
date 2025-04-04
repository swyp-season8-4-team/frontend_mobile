import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/user_store/get_user_store_list_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/get_user_store_list_summary_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/get_user_store_location_entity.dart';
import 'package:retrofit/http.dart';

part 'generated/user_store_remote_data_source.g.dart';

final Provider<UserStoreRemoteDataSource> userStoreApiProvider =
    Provider<UserStoreRemoteDataSource>((Ref ref) {
      return UserStoreRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class UserStoreRemoteDataSource {
  factory UserStoreRemoteDataSource(Dio dio) = _UserStoreRemoteDataSource;

  /// [저장 리스트 전체 조회](https://release.desserbee.com/swagger-ui/index.html#/UserStore/getUserStoreLists)
  @GET('/api/user-store/{userUuid}/lists')
  Future<List<GetUserStoreListEntity>> getUserStoreListAll({
    @Path() required String userUuid,
  });

  /// [저장 리스트 생성](https://release.desserbee.com/swagger-ui/index.html#/UserStore/createUserStoreList)
  @POST('/api/user-store/{userUuid}/lists')
  Future<void> addUserStoreList({@Path() required String userUuid});

  /// [리스트에 가게 저장](https://release.desserbee.com/swagger-ui/index.html#/UserStore/addStoreToList)
  @POST('/api/user-store/lists/{listId}/stores/{storeUuid}')
  Future<void> addStoreToUserStoreList({
    @Path() required int listId,
    @Path() required String storeUuid,
  });

  /// [리스트에 저장된 가게 삭제](https://release.desserbee.com/swagger-ui/index.html#/UserStore/removeStoreFromList)
  @DELETE('/api/user-store/lists/{listId}/stores/{storeUuid}')
  Future<void> deleteStoreFromUserStoreList({
    @Path() required int listId,
    @Path() required String storeUuid,
  });

  /// [저장 리스트 정보 조회](https://release.desserbee.com/swagger-ui/index.html#/UserStore/getUserStoreList)
  @GET('/api/user-store/lists/{listId}')
  Future<GetUserStoreListSummaryEntity> getUserStoreListSummary({
    @Path() required int listId,
  });

  /// [저장 리스트 삭제](https://release.desserbee.com/swagger-ui/index.html#/UserStore/deleteUserStoreList)
  @DELETE('/api/user-store/lists/{listId}')
  Future<void> deleteUserStoreList({@Path() required int listId});

  /// [저장 리스트 수정](https://release.desserbee.com/swagger-ui/index.html#/UserStore/updateUserStoreList)
  @PATCH('/api/user-store/lists/{listId}')
  Future<void> updateUserStoreList({@Path() required int listId});

  /// [리스트에 저장된 가게 조회](https://release.desserbee.com/swagger-ui/index.html#/UserStore/getStoresByList)
  @GET('/api/user-store/lists/{listId}/stores')
  Future<GetUserStoreListEntity> getStoresByUserStoreList({
    @Path() required int listId,
  });

  /// [저장 리스트 내 가게 위치 조회](https://release.desserbee.com/swagger-ui/index.html#/UserStore/getStoresByListId)
  @GET('/api/user-store/lists/{listId}/stores/locations')
  Future<List<GetUserStoreLocationEntity>> getUserStoreLocations({
    @Path() required int listId,
  });
}
