// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponDetailEntity _$CouponDetailEntityFromJson(Map<String, dynamic> json) =>
    CouponDetailEntity(
      userCouponId: (json['userCouponId'] as num).toInt(),
      couponName: json['couponName'] as String,
      couponCode: json['couponCode'] as String,
      storeName: json['storeName'] as String,
      conditionType: json['conditionType'] as String,
      expiryDate:
          json['expiryDate'] == null
              ? null
              : DateTime.parse(json['expiryDate'] as String),
      qrImageUrl: json['qrImageUrl'] as String?,
      used: json['used'] as bool?,
      expired: json['expired'] as bool?,
    );

Map<String, dynamic> _$CouponDetailEntityToJson(CouponDetailEntity instance) =>
    <String, dynamic>{
      'userCouponId': instance.userCouponId,
      'couponName': instance.couponName,
      'couponCode': instance.couponCode,
      'qrImageUrl': instance.qrImageUrl,
      'storeName': instance.storeName,
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'used': instance.used,
      'conditionType': instance.conditionType,
      'expired': instance.expired,
    };
