// ignore_for_file: constant_identifier_names

/// 데이터 호출 상태 정의
enum Status { initial, loading, success, failure }

/// 상태 코드 정의
/// TODO: 성공 및 실패에 대한 정리 필요
enum Code {
  C001(description: 'INVALID_INPUT_VALUE', httpStatus: 400),
  C002(description: 'INTERNAL_SERVER_ERROR', httpStatus: 500),
  C003(description: 'SUCCESS', httpStatus: 200);

  const Code({required this.description, required this.httpStatus});

  final String description;
  final int httpStatus;
}
