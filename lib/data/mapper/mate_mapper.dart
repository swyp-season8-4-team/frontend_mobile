import 'package:frontend_mobile/data/entity/mate/mate_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_entity.dart';
import 'package:frontend_mobile/data/query_param/mate/get_mate_query_param.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';

extension MateEntityExt on MateEntity {
  MateModel toModel() {
    return MateModel(
      mates: mates.map((MateDetailEntity e) => e.toModel()).toList(),
      last: last,
    );
  }
}

extension MateDetailEntityExt on MateDetailEntity {
  MateDetailModel toModel() {
    return MateDetailModel(
      mateUuid: mateUuid,
      storeId: storeId,
      userUuid: userUuid,
      nickname: nickname,
      title: title,
      content: content,
      recruitYn: recruitYn,
      mateImage: mateImage,
      profileImage: profileImage,
      place: place?.toModel(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      saved: saved,
      applyStatus: applyStatus,
      gender: gender,
      mateCategory: mateCategory,
    );
  }
}

extension PlaceEntityExt on PlaceEntity {
  PlaceModel toModel() {
    return PlaceModel(
      placeName: placeName,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension GetMateParamsExt on GetMateParams {
  GetMateQueryParam toQuery() {
    return GetMateQueryParam(
      from: from,
      to: to,
      keyword: keyword,
      mateCategoryId: mateCategoryId,
      recruit: recruit,
    );
  }
}
