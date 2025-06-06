import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/api_call.dart';
import 'package:frontend_mobile/core/resource/exception/custom_exception.dart';
import 'package:frontend_mobile/core/resource/result.dart';
import 'package:frontend_mobile/data/data_source/remote/mate_remote_data_source.dart';
import 'package:frontend_mobile/data/entity/mate/mate_delete_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_detail_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_patch_entity.dart';
import 'package:frontend_mobile/data/entity/mate/mate_report_entity.dart';
import 'package:frontend_mobile/data/mapper/mate_mapper.dart';
import 'package:frontend_mobile/domain/model/mate/mate_delete_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_patch_model.dart';
import 'package:frontend_mobile/domain/model/mate/mate_report_model.dart';
import 'package:frontend_mobile/domain/param/mate/delete_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_detail_params.dart';
import 'package:frontend_mobile/domain/param/mate/get_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/get_my_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/patch_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_params.dart';
import 'package:frontend_mobile/domain/param/mate/post_mate_report_params.dart';
import 'package:frontend_mobile/domain/repository/mate_repository.dart';

final Provider<MateRepository> mateRepositoryProvider =
    Provider<MateRepository>(
      (Ref ref) => MateRepositoryImpl(api: ref.read(mateApiProvider)),
    );

class MateRepositoryImpl implements MateRepository {
  MateRepositoryImpl({required this.api});

  final MateRemoteDataSource api;

  @override
  Future<Result<MateModel, CustomException>> getMate({
    required GetMateParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateEntity result = await api.getMates(query: params.toQuery());

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MateDetailModel, CustomException>> getMateDetail({
    required GetMateDetailParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateDetailEntity result = await api.getMateDetail(
          mateUuid: params.mateUuid,
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MateModel, CustomException>> getMyMates({
    required GetMyMateParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateEntity result = await api.getMyMates(query: params.toQuery());

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MateDetailModel, CustomException>> postMate({
    required PostMateParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateDetailEntity result = await api.postMate(
          formData: params.toBody().toFormData(),
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MateReportModel, CustomException>> postMateReport({
    required PostMateReportParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateReportEntity result = await api.postMateReport(
          mateUuid: params.mateUuid,
          body: params.toBody(),
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MatePatchModel, CustomException>> patchMate({
    required PatchMateParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MatePatchEntity result = await api.patchMate(
          mateUuid: params.mateUuid,
          formData: params.toBody().toFormData(),
        );

        return result.toModel();
      },
    );
  }

  @override
  Future<Result<MateDeleteModel, CustomException>> deleteMate({
    required DeleteMateParams params,
  }) async {
    return await apiCall(
      api: () async {
        final MateDeleteEntity result = await api.deleteMate(
          mateUuid: params.mateUuid,
        );

        return result.toModel();
      },
    );
  }
}
