/// 이메일 인증 호출 목적
enum EmailPurpose {
  signUp(value: 'SIGNUP'),
  passwordReset(value: 'PASSWORD_RESET');

  const EmailPurpose({required this.value});

  final String value;
}
