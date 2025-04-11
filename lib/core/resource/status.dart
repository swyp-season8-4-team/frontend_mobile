/// 데이터 호출 상태 정의
enum Status { initial, loading, success, failure }

extension StatusExt on Status {
  bool get isInitial => this == Status.initial;
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
}
