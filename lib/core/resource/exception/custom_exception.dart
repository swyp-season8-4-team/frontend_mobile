import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/core/resource/exception/exception_model.dart';

part 'generated/custom_exception.freezed.dart';

@freezed
/// 에러 모델([문서](https://www.notion.so/1b5c3a9f020181b48806ef4d470b4cd5?pvs=4))
class CustomException with _$CustomException {
  // 문서에 정의된 에러 코드들
  const factory CustomException.invalidInputValue({
    required ExceptionModel model,
  }) = InvalidInputValue;
  const factory CustomException.internalServerError({
    required ExceptionModel model,
  }) = InternalServerError;
  const factory CustomException.duplicateEmail({
    required ExceptionModel model,
  }) = DuplicateEmail;
  const factory CustomException.duplicateNickname({
    required ExceptionModel model,
  }) = DuplicateNickname;
  const factory CustomException.invalidVerificationToken({
    required ExceptionModel model,
  }) = InvalidVerificationToken;
  const factory CustomException.expiredVerificationToken({
    required ExceptionModel model,
  }) = ExpiredVerificationToken;
  const factory CustomException.passwordMismatch({
    required ExceptionModel model,
  }) = PasswordMismatch;
  const factory CustomException.invalidCredentials({
    required ExceptionModel model,
  }) = InvalidCredentials;
  const factory CustomException.signupRestrictedDeletedAccount({
    required ExceptionModel model,
  }) = SignupRestrictedDeletedAccount;
  const factory CustomException.emailSendingFailed({
    required ExceptionModel model,
  }) = EmailSendingFailed;
  const factory CustomException.tooManyVerificationRequests({
    required ExceptionModel model,
  }) = TooManyVerificationRequests;
  const factory CustomException.emailAlreadyRegistered({
    required ExceptionModel model,
  }) = EmailAlreadyRegistered;
  const factory CustomException.userNotFound({required ExceptionModel model}) =
      UserNotFound;
  const factory CustomException.userDeleted({required ExceptionModel model}) =
      UserDeleted;
  const factory CustomException.invalidUserStatus({
    required ExceptionModel model,
  }) = InvalidUserStatus;
  const factory CustomException.unauthorizedAccess({
    required ExceptionModel model,
  }) = UnauthorizedAccess;
  const factory CustomException.invalidUserUuid({
    required ExceptionModel model,
  }) = InvalidUserUuid;
  const factory CustomException.preferencesNotFound({
    required ExceptionModel model,
  }) = PreferencesNotFound;
  const factory CustomException.userPreferencesNotFound({
    required ExceptionModel model,
  }) = UserPreferencesNotFound;
  const factory CustomException.storeNotFound({required ExceptionModel model}) =
      StoreNotFound;
  const factory CustomException.storeCreationFailed({
    required ExceptionModel model,
  }) = StoreCreationFailed;
  const factory CustomException.storeAccessDenied({
    required ExceptionModel model,
  }) = StoreAccessDenied;
  const factory CustomException.storeAlreadyExists({
    required ExceptionModel model,
  }) = StoreAlreadyExists;
  const factory CustomException.storeListNotFound({
    required ExceptionModel model,
  }) = StoreListNotFound;
  const factory CustomException.storeDuplicateList({
    required ExceptionModel model,
  }) = StoreDuplicateList;
  const factory CustomException.storeDuplicateListName({
    required ExceptionModel model,
  }) = StoreDuplicateListName;
  const factory CustomException.storeDuplicateColor({
    required ExceptionModel model,
  }) = StoreDuplicateColor;
  const factory CustomException.storeAlreadySaved({
    required ExceptionModel model,
  }) = StoreAlreadySaved;
  const factory CustomException.savedStoreNotFound({
    required ExceptionModel model,
  }) = SavedStoreNotFound;
  const factory CustomException.invalidStoreUuid({
    required ExceptionModel model,
  }) = InvalidStoreUuid;
  const factory CustomException.invalidTagSelection({
    required ExceptionModel model,
  }) = InvalidTagSelection;
  const factory CustomException.invalidTagIncluded({
    required ExceptionModel model,
  }) = InvalidTagIncluded;
  const factory CustomException.invalidStoreReviewUuid({
    required ExceptionModel model,
  }) = InvalidStoreReviewUuid;
  const factory CustomException.storeReviewNotFound({
    required ExceptionModel model,
  }) = StoreReviewNotFound;
  const factory CustomException.invalidStoreReview({
    required ExceptionModel model,
  }) = InvalidStoreReview;
  const factory CustomException.invalidStoreMenuUuid({
    required ExceptionModel model,
  }) = InvalidStoreMenuUuid;
  const factory CustomException.storeMenuNotFound({
    required ExceptionModel model,
  }) = StoreMenuNotFound;
  const factory CustomException.invalidStoreMenu({
    required ExceptionModel model,
  }) = InvalidStoreMenu;

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
}
