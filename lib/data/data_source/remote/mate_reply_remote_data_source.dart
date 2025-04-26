import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/mate/mate_entity.dart';
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

  /// 메이트 댓글 전체 조회
  @GET('/api/mates/{mateUuid}/reply')
  Future<MateEntity> getMateReply({@Path() required String mateUuid});
}
