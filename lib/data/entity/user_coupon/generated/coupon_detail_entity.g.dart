// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coupon_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCouponDetailEntity _$UserCouponDetailEntityFromJson(
  Map<String, dynamic> json,
) => UserCouponDetailEntity(
  userCouponId: (json['userCouponId'] as num?)?.toInt() ?? -1,
  qrImageUrl: json['qrImageUrl'] as String? ?? '',
  storeName: json['storeName'] as String? ?? '',
  couponName: json['couponName'] as String? ?? '',
  couponCode: json['couponCode'] as String? ?? '',
  conditionType: json['conditionType'] as String? ?? '',
  storeUuid: json['storeUuid'] as String? ?? '',
  couponUuid: json['couponUuid'] as String? ?? '',
  expiryDate: const DateTimeJsonConverter().fromJson(
    json['expiryDate'] as String?,
  ),
  expired: json['expired'] as bool?,
);

Map<String, dynamic> _$UserCouponDetailEntityToJson(
  UserCouponDetailEntity instance,
) => <String, dynamic>{
  'userCouponId': instance.userCouponId,
  'qrImageUrl': instance.qrImageUrl,
  'storeName': instance.storeName,
  'couponName': instance.couponName,
  'expiryDate': _$JsonConverterToJson<String?, DateTime>(
    instance.expiryDate,
    const DateTimeJsonConverter().toJson,
  ),
  'couponCode': instance.couponCode,
  'conditionType': instance.conditionType,
  'storeUuid': instance.storeUuid,
  'couponUuid': instance.couponUuid,
  'expired': instance.expired,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
