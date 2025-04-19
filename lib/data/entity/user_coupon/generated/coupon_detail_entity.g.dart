// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCouponDetailEntity _$UserCouponDetailEntityFromJson(
  Map<String, dynamic> json,
) => UserCouponDetailEntity(
  userCouponId: (json['userCouponId'] as num).toInt(),
  qrImageUrl: json['qrImageUrl'] as String,
  storeName: json['storeName'] as String,
  couponName: json['couponName'] as String,
  couponCode: json['couponCode'] as String,
  conditionType: json['conditionType'] as String,
  storeUuid: json['storeUuid'] as String,
  couponUuid: json['couponUuid'] as String,
  expiryDate:
      json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
  expired: json['expired'] as bool?,
);

Map<String, dynamic> _$UserCouponDetailEntityToJson(
  UserCouponDetailEntity instance,
) => <String, dynamic>{
  'userCouponId': instance.userCouponId,
  'qrImageUrl': instance.qrImageUrl,
  'storeName': instance.storeName,
  'couponName': instance.couponName,
  'expiryDate': instance.expiryDate?.toIso8601String(),
  'couponCode': instance.couponCode,
  'conditionType': instance.conditionType,
  'storeUuid': instance.storeUuid,
  'couponUuid': instance.couponUuid,
  'expired': instance.expired,
};
