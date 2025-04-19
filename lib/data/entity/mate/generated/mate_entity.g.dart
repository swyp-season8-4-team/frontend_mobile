// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../mate_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MateEntity _$MateEntityFromJson(Map<String, dynamic> json) => MateEntity(
  mates:
      (json['mates'] as List<dynamic>?)
          ?.map((e) => MateDetailEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MateDetailEntity>[],
  last: json['last'] as bool? ?? false,
);

Map<String, dynamic> _$MateEntityToJson(MateEntity instance) =>
    <String, dynamic>{'mates': instance.mates, 'last': instance.last};
