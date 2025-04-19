// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponEntity _$CouponEntityFromJson(Map<String, dynamic> json) => CouponEntity(
  userCouponId: (json['userCouponId'] as num).toInt(),
  couponName: json['couponName'] as String,
  couponCode: json['couponCode'] as String,
  storeName: json['storeName'] as String,
  qrImageUrl: json['qrImageUrl'] as String?,
  expiryDate:
      json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
  used: json['used'] as bool?,
);

Map<String, dynamic> _$CouponEntityToJson(CouponEntity instance) =>
    <String, dynamic>{
      'userCouponId': instance.userCouponId,
      'couponName': instance.couponName,
      'couponCode': instance.couponCode,
      'qrImageUrl': instance.qrImageUrl,
      'storeName': instance.storeName,
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'used': instance.used,
    };
