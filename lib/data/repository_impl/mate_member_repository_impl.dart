import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/mate_member_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/mate_member/mate_member_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate_member/mate_member_entity.dart';
import 'package:frontend_mobile/data/mapper/mate_member_mapper.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_member/mate_member_model.dart';
import 'package:frontend_mobile/domain/param/mate_member/accept_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/delete_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/leave_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/pending_mate_member_params.dart';
import 'package:frontend_mobile/domain/param/mate_member/post_mate_member_params.dart';
import 'package:frontend_mobile/domain/repository/mate_member_repository.dart';

final Provider<MateMemberRepository> mateMemberRepositoryProvider = Provider<
  MateMemberRepository
>((Ref ref) => MateMemberRepositoryImpl(api: ref.read(mateMemberApiProvider)));

class MateMemberRepositoryImpl implements MateMemberRepository {
  MateMemberRepositoryImpl({required this.api});

  final MateMemberRemoteDataSource api;

  @override
  Future<Result<MateMemberModel, CustomException>> postMateMember({
    required PostMateMemberParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateMemberEntity result = await api.postMateMember(
          mateUuid: params.mateUuid,
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MateMemberModel, CustomException>> deleteMateMember({
    required DeleteMateMemberParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateMemberEntity result = await api.deleteMateMember(
          mateUuid: params.mateUuid,
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MateMemberModel, CustomException>> leaveMateMember({
    required LeaveMateMemberParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateMemberEntity result = await api.leaveMateMember(
          mateUuid: params.mateUuid,
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<List<MateMemberDetailModel>, CustomException>>
  getPendingMateMember({required PendingMateMemberParams params}) async {
    return await apiCall(
      api: () async {
        final List<MateMemberDetailEntity> result = await api
            .getPendingMateMember(mateUuid: params.mateUuid);

        return result.map((MateMemberDetailEntity e) => e.toModel()).toList();
      },
    );
  }

  @override
  Future<Result<MateMemberModel, CustomException>> acceptMateMember({
    required AcceptMateMemberParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateMemberEntity result = await api.acceptMateMember(
          mateUuid: params.mateUuid,
          body: params.toBody(),
        );

        return result.toModel();
      },
    );
  }
}
