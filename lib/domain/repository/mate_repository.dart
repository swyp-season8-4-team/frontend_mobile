import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/get_my_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_params.dart';

abstract interface class MateRepository {
  /// 메이트 전체 조회
  Future<Result<MateModel, CustomException>> getMate({
    required GetMateParams params,
  });

  /// 메이트 상세 정보 조회
  Future<Result<MateDetailModel, CustomException>> getMateDetail({
    required GetMateDetailParams params,
  });

  /// 메이트 생성
  Future<Result<MateDetailModel, CustomException>> postMate({
    required PostMateParams params,
  });

  /// 내가 참여한 디저트메이트 조회
  Future<Result<MateModel, CustomException>> getMyMates({
    required GetMyMateParams params,
  });
}
