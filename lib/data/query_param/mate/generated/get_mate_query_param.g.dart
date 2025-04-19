// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_mate_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMateQueryParam _$GetMateQueryParamFromJson(Map<String, dynamic> json) =>
    GetMateQueryParam(
      from: (json['from'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      keyword: json['keyword'] as String?,
      mateCategoryId: (json['mateCategoryId'] as num?)?.toInt(),
      recruit: json['recruit'] as bool?,
    );

Map<String, dynamic> _$GetMateQueryParamToJson(GetMateQueryParam instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'keyword': instance.keyword,
      'mateCategoryId': instance.mateCategoryId,
      'recruit': instance.recruit,
    };
