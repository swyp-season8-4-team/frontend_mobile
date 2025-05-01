// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_my_mate_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyMateQueryParam _$GetMyMateQueryParamFromJson(Map<String, dynamic> json) =>
    GetMyMateQueryParam(
      from: (json['from'] as num).toInt(),
      to: (json['to'] as num).toInt(),
    );

Map<String, dynamic> _$GetMyMateQueryParamToJson(
  GetMyMateQueryParam instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};
