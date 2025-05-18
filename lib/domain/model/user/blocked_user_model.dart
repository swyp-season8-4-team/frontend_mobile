class BlockedUserModel {
  const BlockedUserModel({
    required this.id,
    required this.blockerUserUuid,
    required this.blockedUserUuid,
    required this.blockedUserNickname,
    required this.createdAt,
    required this.blocked,
  });
  final int id;
  final String blockerUserUuid;
  final String blockedUserUuid;
  final String blockedUserNickname;
  final DateTime createdAt;
  final bool blocked;
}
