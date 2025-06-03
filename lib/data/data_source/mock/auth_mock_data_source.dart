//ignore: implementation_imports
import 'package:dio/src/form_data.dart';
import 'package:frontend_mobile/data/data_source/remote/auth_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/auth/local_login_entity.dart';
import 'package:frontend_mobile/data/entity/auth/password_reset_entity.dart';
import 'package:frontend_mobile/data/entity/auth/sign_up_with_profile_entity.dart';
import 'package:frontend_mobile/data/request_body/auth/local_login_request_body.dart';
import 'package:frontend_mobile/data/request_body/auth/password_reset_request_body.dart';

class AuthMockDataSource implements AuthRemoteDataSource {
  @override
  Future<LocalLoginEntity> postDevLocalLogin({
    required LocalLoginRequestBody body,
  }) {
    return Future<LocalLoginEntity>(
      () => const LocalLoginEntity(
        accessToken:
            'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkZXNzZXJ0YmVlLmNvbSIsImlhdCI6MTc0Mzg1ODkzNywiZXhwIjoxNzQzODU5MTE3LCJqdGkiOiJlMDhhMzRmYy03NDYyLTRmYzgtYTI4Zi02YTkyY2Y2Nzc5N2MiLCJ0eXBlIjoiQUNDRVNTIiwic3ViIjoiODcyYjI4MWItZmQzOS00ZTg4LTlmMmYtMTIzNDQxM2YyZGUwIiwicm9sZXMiOlsiUk9MRV9VU0VSIl19.W3MMfgoo4UKqslrfTkMMSxO3fobkDfkteriX7ZMrU5o',
        refreshToken:
            'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkZXNzZXJ0YmVlLmNvbSIsImlhdCI6MTc0Mzg1ODkzNywiZXhwIjoxNzQzODU5NTM3LCJqdGkiOiJkYzc0NWZiYS0zNTJiLTQ4YzEtOTI5Mi1kOTg1YmUxZDQ2YjQiLCJ0eXBlIjoiUkVGUkVTSCIsInN1YiI6Ijg3MmIyODFiLWZkMzktNGU4OC05ZjJmLTEyMzQ0MTNmMmRlMCJ9.yg3FelMBBWXXNgN6Y4kmCWFQ3Qr9FXOKCnUvSzwKu6k',
        tokenType: 'Bearer',
        expiresIn: 180,
        userUuid: '872b281b-fd39-4e88-9f2f-1234413f2de0',
        email: 'dudals9701@naver.com',
        nickname: '일반테스트1',
        deviceId: 'a5b802cf-d279-46d2-8cd8-75dc581b6c60',
        preferenceSet: true,
      ),
    );
  }

  @override
  Future<LocalLoginEntity> postLocalLogin({
    required LocalLoginRequestBody body,
  }) {
    return Future<LocalLoginEntity>(
      () => const LocalLoginEntity(
        accessToken:
            'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkZXNzZXJ0YmVlLmNvbSIsImlhdCI6MTc0Mzg1ODkzNywiZXhwIjoxNzQzODU5MTE3LCJqdGkiOiJlMDhhMzRmYy03NDYyLTRmYzgtYTI4Zi02YTkyY2Y2Nzc5N2MiLCJ0eXBlIjoiQUNDRVNTIiwic3ViIjoiODcyYjI4MWItZmQzOS00ZTg4LTlmMmYtMTIzNDQxM2YyZGUwIiwicm9sZXMiOlsiUk9MRV9VU0VSIl19.W3MMfgoo4UKqslrfTkMMSxO3fobkDfkteriX7ZMrU5o',
        refreshToken:
            'eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJkZXNzZXJ0YmVlLmNvbSIsImlhdCI6MTc0Mzg1ODkzNywiZXhwIjoxNzQzODU5NTM3LCJqdGkiOiJkYzc0NWZiYS0zNTJiLTQ4YzEtOTI5Mi1kOTg1YmUxZDQ2YjQiLCJ0eXBlIjoiUkVGUkVTSCIsInN1YiI6Ijg3MmIyODFiLWZkMzktNGU4OC05ZjJmLTEyMzQ0MTNmMmRlMCJ9.yg3FelMBBWXXNgN6Y4kmCWFQ3Qr9FXOKCnUvSzwKu6k',
        tokenType: 'Bearer',
        expiresIn: 180,
        userUuid: '872b281b-fd39-4e88-9f2f-1234413f2de0',
        email: 'dudals9701@naver.com',
        nickname: '일반테스트1',
        deviceId: 'a5b802cf-d279-46d2-8cd8-75dc581b6c60',
        preferenceSet: true,
      ),
    );
  }

  @override
  Future<SignUpWithProfileEntity> postSignUp({
    required String emailToken,
    required FormData formData,
  }) {
    // TODO: implement postSignUp
    throw UnimplementedError();
  }

  @override
  Future<PasswordResetEntity> postPasswordReset({
    required String emailToken,
    required PasswordResetRequestBody body,
  }) {
    // TODO: implement postPasswordReset
    throw UnimplementedError();
  }
}
