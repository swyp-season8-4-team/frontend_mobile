class BanMateMemberParams {
  BanMateMemberParams({
    required this.mateUuid,
    required this.creatorUserUuid,
    required this.banUserUuid,
  });

  final String mateUuid;
  final String creatorUserUuid;
  final String banUserUuid;
}
