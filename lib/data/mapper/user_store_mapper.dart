import 'package:frontend_mobile/data/entity/user_store/user_store_list_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_list_summary_entity.dart';
import 'package:frontend_mobile/data/entity/user_store/user_store_location_entity.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_list_summary_model.dart';
import 'package:frontend_mobile/domain/model/user_store/user_store_location_model.dart';

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
              //ignore: always_specify_types
              (e) => UserStoreModel(
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
