import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/mate_member/mate_member_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate_member/mate_member_entity.dart';
import 'package:frontend_mobile/data/request_body/mate_member/accept_mate_member_request_body.dart';
import 'package:frontend_mobile/data/request_body/mate_member/ban_mate_member_request_body.dart';
import 'package:frontend_mobile/data/request_body/mate_member/reject_mate_member_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'generated/mate_member_remote_data_source.g.dart';

final Provider<MateMemberRemoteDataSource> mateMemberApiProvider =
    Provider<MateMemberRemoteDataSource>((Ref ref) {
      final Dio dio = ref.read(appDioProvider);
      return MateMemberRemoteDataSource(dio);
    });

@RestApi()
abstract interface class MateMemberRemoteDataSource {
  factory MateMemberRemoteDataSource(Dio dio, {String? baseUrl}) =
      _MateMemberRemoteDataSource;

  /// 디저트 메이트 멤버 신청
  @POST('/api/mates/{mateUuid}/apply')
  Future<MateMemberEntity> postMateMember({@Path() required String mateUuid});

  /// 디저트 메이트 멤버 신청 취소
  @DELETE('/api/mates/{mateUuid}/apply')
  Future<MateMemberEntity> deleteMateMember({@Path() required String mateUuid});

  /// 디저트 메이트 멤버 신청 탈퇴
  @DELETE('/api/mates/{mateUuid}/leave')
  Future<MateMemberEntity> leaveMateMember({@Path() required String mateUuid});

  /// 디저트 메이트 대기 멤버 전체 조회
  @GET('/api/mates/{mateUuid}/pending')
  Future<List<MateMemberDetailEntity>> getPendingMateMember({
    @Path() required String mateUuid,
  });

  /// 디저트 메이트 멤버 신청 수락
  @PATCH('/api/mates/{mateUuid}/apply')
  Future<MateMemberEntity> acceptMateMember({
    @Path() required String mateUuid,
    @Body() required AcceptMateMemberRequestBody body,
  });

  /// 디저트 메이트 멤버 신청 거절
  @DELETE('/api/mates/{mateUuid}/reject')
  Future<MateMemberEntity> rejectMateMember({
    @Path() required String mateUuid,
    @Body() required RejectMateMemberRequestBody body,
  });

  /// 디저트 메이트 멤버 전체 조회
  @GET('/api/mates/{mateUuid}/members')
  Future<List<MateMemberDetailEntity>> getMateMember({
    @Path() required String mateUuid,
  });

  /// 디저트 메이트 멤버 신청 강퇴
  @DELETE('/api/mates/{mateUuid}/members')
  Future<MateMemberEntity> banMateMember({
    @Path() required String mateUuid,
    @Body() required BanMateMemberRequestBody body,
  });
}
