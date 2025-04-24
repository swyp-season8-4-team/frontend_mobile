import 'package:collection/collection.dart';
import 'package:frontend_mobile/core/resource/constant.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_detail_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_summary_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_location_entity.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_detail_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_summary_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_location_model.dart';

extension UserStoreListDetailEntityExt on UserStoreListDetailEntity {
  UserStoreListDetailModel toModel() => UserStoreListDetailModel(
    listId: listId,
    userUuid: userUuid,
    listName: listName,
    iconColor:
        StoreListIconColor.values.firstWhereOrNull(
          (StoreListIconColor e) => e.id == iconColorId,
        ) ??
        StoreListIconColor.yellow,
    storeCount: storeCount,
    storeData:
        storeData
            ?.map(
              //ignore: always_specify_types
              (e) => UserStoreDetailModel(
                userUuid: e.userUuid,
                storeUuid: e.storeUuid,
                listId: e.listId,
                listName: e.listName,
                storeName: e.storeName,
                storeAddress: e.storeAddress,
                latitude: e.latitude,
                longitude: e.longitude,
                imageUrls: e.imageUrls,
                userPreferences: e.userPreferences,
              ),
            )
            .toList(),
  );
}

extension UserStoreListSummaryEntityExt on UserStoreListSummaryEntity {
  UserStoreListSummaryModel toModel() => UserStoreListSummaryModel(
    listId: listId,
    listName: listName,
    iconColorId: iconColorId,
  );
}

extension UserStoreLocationEntityExt on UserStoreLocationEntity {
  UserStoreLocationModel toModel() => UserStoreLocationModel(
    listId: listId,
    iconColorId: iconColorId,
    storeId: storeId,
    name: name,
    latitude: latitude,
    longitude: longitude,
  );
}

extension UserStoreListEntityExt on UserStoreListEntity {
  UserStoreListModel toModel() => UserStoreListModel(
    listId: listId,
    userUuid: userUuid,
    listName: listName,
    iconColorId: iconColorId,
    storeCount: storeCount,
    storeData:
        storeData
            ?.map(
              (UserStoreDataEntity e) => UserStoreDataModel(
                listId: e.listId,
                iconColorId: e.iconColorId,
                storeId: e.storeId,
                storeUuid: e.storeUuid,
                name: e.name,
                latitude: e.latitude,
                longitude: e.longitude,
              ),
            )
            .toList(),
  );
}
