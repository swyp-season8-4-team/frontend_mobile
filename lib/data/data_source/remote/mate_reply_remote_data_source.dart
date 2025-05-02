import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_entity.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_report_entity.dart';
import 'package:frontend_mobile/data/query_param/mate_reply/get_mate_reply_query_param.dart';
import 'package:frontend_mobile/data/request_body/mate_reply/post_mate_reply_report_request_body.dart';
import 'package:frontend_mobile/data/request_body/mate_reply/post_mate_reply_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/mate_reply_remote_data_source.g.dart';

final Provider<MateReplyRemoteDataSource> mateReplyApiProvider =
    Provider<MateReplyRemoteDataSource>((Ref ref) {
      final Dio dio = ref.read(appDioProvider);
      return MateReplyRemoteDataSource(dio);
    });

@RestApi()
abstract interface class MateReplyRemoteDataSource {
  factory MateReplyRemoteDataSource(Dio dio, {String? baseUrl}) =
      _MateReplyRemoteDataSource;

  /// [App]메이트 댓글 전체 조회
  @GET('/api/app/mates/{mateUuid}/reply')
  Future<MateReplyEntity> getMateReply({
    @Path() required String mateUuid,
    @Queries() required GetMateReplyQueryParam query,
  });

  /// [App]메이트 댓글 생성
  @POST('/api/app/mates/{mateUuid}/reply')
  Future<MateReplyDetailEntity> postMateReply({
    @Path() required String mateUuid,
    @Body() required PostMateReplyRequestBody body,
  });

  /// 디저트메이트 댓글 신고
  @POST('/api/{mateUuid}/reply/{replyId}/report')
  Future<MateReplyReportEntity> postMateReplyReport({
    @Path() required String mateUuid,
    @Path() required String replyId,
    @Body() required PostMateReplyReportRequestBody body,
  });
}
