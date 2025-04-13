// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_mate_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMateQueryParam _$GetMateQueryParamFromJson(Map<String, dynamic> json) =>
    GetMateQueryParam(
      keyword: json['keyword'] as String?,
      mateCategoryId: (json['mateCategoryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetMateQueryParamToJson(GetMateQueryParam instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'mateCategoryId': instance.mateCategoryId,
    };
