class PasswordResetModel {
  const PasswordResetModel({
    required this.success,
    required this.message,
    required this.status,
    required this.timestamp,
  });

  final bool? success;
  final String? message;
  final int? status;
  final String? timestamp;
}
