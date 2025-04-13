class EmailVerificationRequestModel {
  const EmailVerificationRequestModel({
    required this.message,
    required this.expirationMinutes,
  });

  final String message;
  final int expirationMinutes;
}
