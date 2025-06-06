import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/mate/mate_delete_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_patch_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_report_entity.dart';
import 'package:frontend_mobile/data/query_param/mate/get_mate_query_param.dart';
import 'package:frontend_mobile/data/query_param/mate/get_my_mate_query_param.dart';
import 'package:frontend_mobile/data/request_body/mate/post_mate_report_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/mate_remote_data_source.g.dart';

final Provider<MateRemoteDataSource> mateApiProvider =
    Provider<MateRemoteDataSource>((Ref ref) {
      final Dio dio = ref.read(appDioProvider);
      return MateRemoteDataSource(dio);
    });

@RestApi()
abstract interface class MateRemoteDataSource {
  factory MateRemoteDataSource(Dio dio, {String? baseUrl}) =
      _MateRemoteDataSource;

  /// 메이트 전체 조회
  @GET('/api/mates')
  Future<MateEntity> getMates({@Queries() required GetMateQueryParam query});

  /// 메이트 상세 정보 조회
  @GET('/api/mates/{mateUuid}')
  Future<MateDetailEntity> getMateDetail({@Path() required String mateUuid});

  /// 내가 참여한 메이트 조회
  @GET('/api/mates/me')
  Future<MateEntity> getMyMates({
    @Queries() required GetMyMateQueryParam query,
  });

  /// 메이트 생성
  @POST('/api/app/mates')
  @MultiPart()
  Future<MateDetailEntity> postMate({@Body() required FormData formData});

  /// 디저트메이트 신고 기능
  @POST('/api/mates/{mateUuid}/report')
  Future<MateReportEntity> postMateReport({
    @Path() required String mateUuid,
    @Body() required PostMateReportRequestBody body,
  });

  /// 메이트 수정
  @PATCH('/api/mates/{mateUuid}')
  @MultiPart()
  Future<MatePatchEntity> patchMate({
    @Path() required String mateUuid,
    @Body() required FormData formData,
  });

  /// 메이트 삭제
  @DELETE('/api/mates/{mateUuid}')
  Future<MateDeleteEntity> deleteMate({@Path() required String mateUuid});
}
