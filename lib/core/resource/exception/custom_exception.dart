import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';

part 'generated/custom_exception.freezed.dart';

@freezed
/// 에러 모델([문서](https://www.notion.so/1b5c3a9f020181b48806ef4d470b4cd5?pvs=4))
class CustomException with _$CustomException {
  // 문서에 정의된 에러 코드들
  const factory CustomException.c001({required ExceptionModel model}) = C001;
  const factory CustomException.c002({required ExceptionModel model}) = C002;
  const factory CustomException.a001({required ExceptionModel model}) = A001;
  const factory CustomException.a002({required ExceptionModel model}) = A002;
  const factory CustomException.a003({required ExceptionModel model}) = A003;
  const factory CustomException.a004({required ExceptionModel model}) = A004;
  const factory CustomException.a005({required ExceptionModel model}) = A005;
  const factory CustomException.a006({required ExceptionModel model}) = A006;
  const factory CustomException.a007({required ExceptionModel model}) = A007;
  const factory CustomException.a008({required ExceptionModel model}) = A008;
  const factory CustomException.a009({required ExceptionModel model}) = A009;
  const factory CustomException.a010({required ExceptionModel model}) = A010;
  const factory CustomException.a011({required ExceptionModel model}) = A011;
  const factory CustomException.a012({required ExceptionModel model}) = A012;
  const factory CustomException.a013({required ExceptionModel model}) = A013;
  const factory CustomException.a014({required ExceptionModel model}) = A014;
  const factory CustomException.a015({required ExceptionModel model}) = A015;
  const factory CustomException.a016({required ExceptionModel model}) = A016;
  const factory CustomException.b001({required ExceptionModel model}) = B001;
  const factory CustomException.b002({required ExceptionModel model}) = B002;
  const factory CustomException.b003({required ExceptionModel model}) = B003;
  const factory CustomException.o001({required ExceptionModel model}) = O001;
  const factory CustomException.j001({required ExceptionModel model}) = J001;
  const factory CustomException.j002({required ExceptionModel model}) = J002;
  const factory CustomException.j003({required ExceptionModel model}) = J003;
  const factory CustomException.j004({required ExceptionModel model}) = J004;
  const factory CustomException.j005({required ExceptionModel model}) = J005;
  const factory CustomException.e001({required ExceptionModel model}) = E001;
  const factory CustomException.e005({required ExceptionModel model}) = E005;
  const factory CustomException.u001({required ExceptionModel model}) = U001;
  const factory CustomException.u004({required ExceptionModel model}) = U004;
  const factory CustomException.u005({required ExceptionModel model}) = U005;
  const factory CustomException.p001({required ExceptionModel model}) = P001;
  const factory CustomException.p002({required ExceptionModel model}) = P002;
  const factory CustomException.k001({required ExceptionModel model}) = K001;
  const factory CustomException.k002({required ExceptionModel model}) = K002;
  const factory CustomException.s001({required ExceptionModel model}) = S001;
  const factory CustomException.s002({required ExceptionModel model}) = S002;
  const factory CustomException.s003({required ExceptionModel model}) = S003;
  const factory CustomException.s004({required ExceptionModel model}) = S004;
  const factory CustomException.s005({required ExceptionModel model}) = S005;
  const factory CustomException.s007({required ExceptionModel model}) = S007;
  const factory CustomException.s009({required ExceptionModel model}) = S009;
  const factory CustomException.s010({required ExceptionModel model}) = S010;
  const factory CustomException.s011({required ExceptionModel model}) = S011;
  const factory CustomException.s012({required ExceptionModel model}) = S012;
  const factory CustomException.s013({required ExceptionModel model}) = S013;
  const factory CustomException.s014({required ExceptionModel model}) = S014;
  const factory CustomException.s015({required ExceptionModel model}) = S015;
  const factory CustomException.s016({required ExceptionModel model}) = S016;
  const factory CustomException.s017({required ExceptionModel model}) = S017;
  const factory CustomException.s018({required ExceptionModel model}) = S018;
  const factory CustomException.s019({required ExceptionModel model}) = S019;
  const factory CustomException.f001({required ExceptionModel model}) = F001;
  const factory CustomException.f002({required ExceptionModel model}) = F002;
  const factory CustomException.f003({required ExceptionModel model}) = F003;
  const factory CustomException.f004({required ExceptionModel model}) = F004;
  const factory CustomException.f005({required ExceptionModel model}) = F005;
  const factory CustomException.i001({required ExceptionModel model}) = I001;
  const factory CustomException.i002({required ExceptionModel model}) = I002;
  const factory CustomException.i003({required ExceptionModel model}) = I003;
  const factory CustomException.m001({required ExceptionModel model}) = M001;
  const factory CustomException.m002({required ExceptionModel model}) = M002;
  const factory CustomException.m003({required ExceptionModel model}) = M003;
  const factory CustomException.m004({required ExceptionModel model}) = M004;
  const factory CustomException.m005({required ExceptionModel model}) = M005;
  const factory CustomException.m006({required ExceptionModel model}) = M006;
  const factory CustomException.m007({required ExceptionModel model}) = M007;
  const factory CustomException.m008({required ExceptionModel model}) = M008;
  const factory CustomException.m009({required ExceptionModel model}) = M009;
  const factory CustomException.m010({required ExceptionModel model}) = M010;
  const factory CustomException.m011({required ExceptionModel model}) = M011;
  const factory CustomException.m012({required ExceptionModel model}) = M012;
  const factory CustomException.m013({required ExceptionModel model}) = M013;
  const factory CustomException.m014({required ExceptionModel model}) = M014;
  const factory CustomException.m015({required ExceptionModel model}) = M015;
  const factory CustomException.m016({required ExceptionModel model}) = M016;
  const factory CustomException.m017({required ExceptionModel model}) = M017;
  const factory CustomException.r001({required ExceptionModel model}) = R001;
  const factory CustomException.r002({required ExceptionModel model}) = R002;
  const factory CustomException.r003({required ExceptionModel model}) = R003;
  const factory CustomException.r004({required ExceptionModel model}) = R004;
  const factory CustomException.r005({required ExceptionModel model}) = R005;
  const factory CustomException.r006({required ExceptionModel model}) = R006;
  const factory CustomException.r007({required ExceptionModel model}) = R007;
  const factory CustomException.r008({required ExceptionModel model}) = R008;

  // 임의로 정의한 에러 코드들
  /// {
  ///   "status": 600,
  ///   "code": "ZZ000",
  ///   "message": "서버로부터 응답이 없습니다.",
  ///   "timestamp": <현재 시간>
  /// }
  const factory CustomException.serverError({required ExceptionModel model}) =
      ServerError;

  /// {
  ///   "status": 601,
  ///   "code": "ZZ001",
  ///   "message": "통신 에러입니다.",
  ///   "timestamp": <현재 시간>
  /// }
  const factory CustomException.networkError({required ExceptionModel model}) =
      NetworkError;

  /// {
  ///   "status": 602,
  ///   "code": "ZZ002",
  ///   "message": "알 수 없는 에러입니다.",
  ///   "timestamp": <현재 시간>
  /// }
  const factory CustomException.unknownError({required ExceptionModel model}) =
      UnknownError;

  /// {
  ///   "status": 603,
  ///   "code": "ZZ003",
  ///   "message": "로그인 시간이 만료되었습니다.\n다시 로그인해주세요.",
  ///   "timestamp": <현재 시간>
  /// }
  const factory CustomException.accessTokenError({
    required ExceptionModel model,
  }) = AccessTokenError;
}
