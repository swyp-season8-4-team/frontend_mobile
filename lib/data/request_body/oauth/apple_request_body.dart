// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'generated/apple_request_body.g.dart';

@JsonSerializable()
class AppleRequestBody {
  AppleRequestBody({
    required this.code,
    required this.state,
    required this.id_token,
    required this.user,
  });

  final String code;
  final String state;
  final String id_token;
  final UserAppleRequestBody user;

  Map<String, dynamic> toJson() => _$AppleRequestBodyToJson(this);
}

@JsonSerializable()
class UserAppleRequestBody {
  factory UserAppleRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UserAppleRequestBodyFromJson(json);

  UserAppleRequestBody({required this.email, required this.name});

  final String email;
  final NameAppleRequestBody name;

  Map<String, dynamic> toJson() => _$UserAppleRequestBodyToJson(this);
}

@JsonSerializable()
class NameAppleRequestBody {
  factory NameAppleRequestBody.fromJson(Map<String, dynamic> json) =>
      _$NameAppleRequestBodyFromJson(json);

  NameAppleRequestBody({required this.firstName, required this.lastName});

  final String firstName;
  final String lastName;

  Map<String, dynamic> toJson() => _$NameAppleRequestBodyToJson(this);
}
