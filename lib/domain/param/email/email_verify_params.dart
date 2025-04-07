class EmailVerifyParams {
  EmailVerifyParams({
    required this.email,
    required this.code,
    required this.purpose,
  });

  final String email;
  final String code;
  final String purpose;
}
