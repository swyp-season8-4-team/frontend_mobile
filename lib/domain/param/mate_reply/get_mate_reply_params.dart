class GetMateReplyParams {
  GetMateReplyParams({required this.mateUuid, this.from = 0, this.to = 10});

  final String mateUuid;
  final int from;
  final int to;
}
