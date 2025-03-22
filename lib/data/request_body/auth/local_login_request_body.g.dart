// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_login_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalLoginRequestBody _$LocalLoginRequestBodyFromJson(
  Map<String, dynamic> json,
) => LocalLoginRequestBody(
  email: json['email'] as String,
  password: json['password'] as String,
  keepLoggedIn: json['keepLoggedIn'] as bool,
);

Map<String, dynamic> _$LocalLoginRequestBodyToJson(
  LocalLoginRequestBody instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'keepLoggedIn': instance.keepLoggedIn,
};
