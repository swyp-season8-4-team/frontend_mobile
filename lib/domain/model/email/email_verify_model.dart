class EmailVerifyModel {
  const EmailVerifyModel({
    required this.verificationToken,
    required this.verified,
  });

  final String verificationToken;
  final bool verified;
}
