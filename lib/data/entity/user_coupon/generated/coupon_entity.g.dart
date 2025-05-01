// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCouponEntity _$UserCouponEntityFromJson(Map<String, dynamic> json) =>
    UserCouponEntity(
      userCouponId: (json['userCouponId'] as num).toInt(),
      couponName: json['couponName'] as String,
      couponCode: json['couponCode'] as String,
      storeName: json['storeName'] as String,
      qrImageUrl: json['qrImageUrl'] as String?,
      expiryDate: const DateTimeJsonConverter().fromJson(
        json['expiryDate'] as String?,
      ),
      used: json['used'] as bool?,
    );

Map<String, dynamic> _$UserCouponEntityToJson(UserCouponEntity instance) =>
    <String, dynamic>{
      'userCouponId': instance.userCouponId,
      'couponName': instance.couponName,
      'couponCode': instance.couponCode,
      'qrImageUrl': instance.qrImageUrl,
      'storeName': instance.storeName,
      'expiryDate': _$JsonConverterToJson<String?, DateTime>(
        instance.expiryDate,
        const DateTimeJsonConverter().toJson,
      ),
      'used': instance.used,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
