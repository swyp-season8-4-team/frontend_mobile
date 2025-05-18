import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend_mobile/data/entity/mate/mate_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_report_entity.dart';
import 'package:frontend_mobile/data/query_param/mate/get_mate_query_param.dart';
import 'package:frontend_mobile/data/query_param/mate/get_my_mate_query_param.dart';
import 'package:frontend_mobile/data/request_body/mate/post_mate_report_request_body.dart';
import 'package:frontend_mobile/data/request_body/mate/post_mate_request_body.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_report_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/get_my_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_report_params.dart';

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
      capacity: capacity,
      currentMemberCount: currentMemberCount,
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
      blockedByAuthorYn: blockedByAuthorYn,
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

extension GetMyMateParamsExt on GetMyMateParams {
  GetMyMateQueryParam toQuery() {
    return GetMyMateQueryParam(from: from, to: to);
  }
}

extension PlaceModelExt on PlaceModel {
  PlaceEntity toEntity() {
    return PlaceEntity(
      placeName: placeName,
      address: address,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension PostMateParamsExt on PostMateParams {
  PostMateRequestBody toBody() {
    return PostMateRequestBody(
      userUuid: userUuid,
      mateCategoryId: mateCategoryId,
      capacity: capacity,
      title: title,
      content: content,
      recruitYn: recruitYn,
      mateImage: mateImage,
      place: place?.toEntity(),
      storeId: storeId,
    );
  }
}

extension PostMateRequestBodyExt on PostMateRequestBody {
  FormData toFormData() {
    final String requestJson = jsonEncode(toJson());

    final MultipartFile request = MultipartFile.fromString(
      requestJson,
      contentType: DioMediaType('application', 'json'),
    );

    return FormData.fromMap(<String, MultipartFile?>{
      'request': request,
      'mateImage': mateImage,
    });
  }
}

extension MateReportEntityExt on MateReportEntity {
  MateReportModel toModel() {
    return MateReportModel(message: message);
  }
}

extension PostMateReportParamsExt on PostMateReportParams {
  PostMateReportRequestBody toBody() {
    return PostMateReportRequestBody(
      userUuid: userUuid,
      reportCategoryId: reportCategoryId,
      reportComment: reportComment,
    );
  }
}
