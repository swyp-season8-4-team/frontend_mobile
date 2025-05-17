import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/data/entity/user/blocked_user_entity.dart';

part 'generated/blocked_user_list_entity.g.dart';

@JsonSerializable()
class BlockedUserListEntity {
  factory BlockedUserListEntity.fromJson(Map<String, dynamic> json) =>
      _$BlockedUserListEntityFromJson(json);
  const BlockedUserListEntity({
    this.blockedUsers = const <BlockedUserEntity>[],
    this.totalCount = -1,
  });

  final List<BlockedUserEntity> blockedUsers;
  final int totalCount;
}
