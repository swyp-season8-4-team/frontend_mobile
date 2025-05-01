class AcceptMateMemberParams {
  AcceptMateMemberParams({
    required this.mateUuid,
    required this.creatorUserUuid,
    required this.acceptUserUuid,
  });

  final String mateUuid;
  final String creatorUserUuid;
  final String acceptUserUuid;
}
