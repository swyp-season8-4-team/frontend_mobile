/// 닉네임 인증 호출 목적
enum Nickname {
  signUp(value: 'SIGNUP'),
  profileUpdate(value: 'PROFILE_UPDATE');

  const Nickname({required this.value});

  final String value;
}
