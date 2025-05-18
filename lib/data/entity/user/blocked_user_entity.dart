import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/util/json_converter.dart';

part 'generated/blocked_user_entity.g.dart';

@JsonSerializable()
class BlockedUserEntity {
  factory BlockedUserEntity.fromJson(Map<String, dynamic> json) =>
      _$BlockedUserEntityFromJson(json);
  const BlockedUserEntity({
    required this.createdAt,
    this.id = -1,
    this.blockerUserUuid = '',
    this.blockedUserUuid = '',
    this.blockedUserNickname = '',
    this.blocked = false,
  });
  final int id;
  final String blockerUserUuid;
  final String blockedUserUuid;
  final String blockedUserNickname;
  @DateTimeJsonConverter()
  final DateTime createdAt;
  final bool blocked;
}
