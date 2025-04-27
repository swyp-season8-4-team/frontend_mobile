// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_mate_reply_query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMateReplyQueryParam _$GetMateReplyQueryParamFromJson(
  Map<String, dynamic> json,
) => GetMateReplyQueryParam(
  from: (json['from'] as num).toInt(),
  to: (json['to'] as num).toInt(),
);

Map<String, dynamic> _$GetMateReplyQueryParamToJson(
  GetMateReplyQueryParam instance,
) => <String, dynamic>{'from': instance.from, 'to': instance.to};
