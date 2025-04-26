import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/mate/mate_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_entity.dart';
import 'package:frontend_mobile/data/query_param/mate/get_mate_query_param.dart';
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
}
