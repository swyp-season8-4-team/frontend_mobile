class PasswordResetParams {
  const PasswordResetParams({
    required this.emailToken,
    required this.email,
    required this.currentPassword,
    required this.newPassword,
  });

  final String emailToken;
  final String email;
  final String currentPassword;
  final String newPassword;
}
