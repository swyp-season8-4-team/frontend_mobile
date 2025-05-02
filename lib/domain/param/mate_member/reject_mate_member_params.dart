class RejectMateMemberParams {
  RejectMateMemberParams({
    required this.mateUuid,
    required this.creatorUserUuid,
    required this.rejectUserUuid,
  });

  final String mateUuid;
  final String creatorUserUuid;
  final String rejectUserUuid;
}
