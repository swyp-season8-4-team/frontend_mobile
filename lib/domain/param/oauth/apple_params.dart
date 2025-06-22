// ignore_for_file: non_constant_identifier_names

class AppleParams {
  AppleParams({
    required this.code,
    required this.state,
    required this.id_token,
    required this.user,
  });

  final String code;
  final String state;
  final String id_token;
  final UserAppleParams user;
}

class UserAppleParams {
  UserAppleParams({required this.email, required this.name});

  final String email;
  final NameAppleParams name;
}

class NameAppleParams {
  NameAppleParams({required this.firstName, required this.lastName});

  final String firstName;
  final String lastName;
}
