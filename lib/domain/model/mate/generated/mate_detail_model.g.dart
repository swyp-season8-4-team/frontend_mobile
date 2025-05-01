// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../mate_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) => PlaceModel(
  placeName: json['placeName'] as String?,
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toInt(),
  longitude: (json['longitude'] as num?)?.toInt(),
);

Map<String, dynamic> _$PlaceModelToJson(PlaceModel instance) =>
    <String, dynamic>{
      'placeName': instance.placeName,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
