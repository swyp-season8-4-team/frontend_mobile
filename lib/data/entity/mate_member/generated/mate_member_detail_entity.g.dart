// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../mate_member_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MateMemberDetailEntity _$MateMemberDetailEntityFromJson(
  Map<String, dynamic> json,
) => MateMemberDetailEntity(
  userId: (json['userId'] as num?)?.toInt() ?? -1,
  userUuid: json['userUuid'] as String? ?? '',
  grade: json['grade'] as String? ?? '',
  profileImage: json['profileImage'] as String? ?? '',
  nickname: json['nickname'] as String? ?? '',
  applyStatus: json['applyStatus'] as String? ?? '',
  gender: json['gender'] as String? ?? '',
);

Map<String, dynamic> _$MateMemberDetailEntityToJson(
  MateMemberDetailEntity instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'userUuid': instance.userUuid,
  'grade': instance.grade,
  'profileImage': instance.profileImage,
  'nickname': instance.nickname,
  'applyStatus': instance.applyStatus,
  'gender': instance.gender,
};
