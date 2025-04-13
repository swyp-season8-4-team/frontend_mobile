// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../preference_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferenceEntity _$PreferenceEntityFromJson(Map<String, dynamic> json) =>
    PreferenceEntity(
      id: (json['id'] as num).toInt(),
      preferenceName: json['preferenceName'] as String,
      preferenceDesc: json['preferenceDesc'] as String,
    );

Map<String, dynamic> _$PreferenceEntityToJson(PreferenceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'preferenceName': instance.preferenceName,
      'preferenceDesc': instance.preferenceDesc,
    };
