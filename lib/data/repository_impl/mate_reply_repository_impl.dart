import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/mate_reply_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate_reply/mate_reply_entity.dart';
import 'package:frontend_mobile/data/mapper/mate_reply_mapper.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_model.dart';
import 'package:frontend_mobile/domain/param/mate_reply/get_mate_reply_params.dart';
import 'package:frontend_mobile/domain/param/mate_reply/post_mate_reply_params.dart';
import 'package:frontend_mobile/domain/repository/mate_reply_repository.dart';

final Provider<MateReplyRepository> mateReplyRepositoryProvider =
    Provider<MateReplyRepository>(
      (Ref ref) => MateReplyRepositoryImpl(api: ref.read(mateReplyApiProvider)),
    );

class MateReplyRepositoryImpl implements MateReplyRepository {
  MateReplyRepositoryImpl({required this.api});

  final MateReplyRemoteDataSource api;

  @override
  Future<Result<MateReplyModel, CustomException>> getMateReply({
    required GetMateReplyParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateReplyEntity result = await api.getMateReply(
          mateUuid: params.mateUuid,
          query: params.toQuery(),
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MateReplyDetailModel, CustomException>> postMateReply({
    required PostMateReplyParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateReplyDetailEntity result = await api.postMateReply(
          mateUuid: params.mateUuid,
          body: params.toBody(),
        );

        return result.toModel();
      },
    );
  }
}
