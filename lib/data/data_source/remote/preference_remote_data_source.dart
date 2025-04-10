import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_mobile/core/resource/network/app_dio.dart';
import 'package:frontend_mobile/data/entity/preference/preference_entity.dart';
import 'package:retrofit/http.dart';

part 'generated/preference_remote_data_source.g.dart';

final Provider<PreferenceRemoteDataSource> preferenceApiProvider =
    Provider<PreferenceRemoteDataSource>((Ref ref) {
      return PreferenceRemoteDataSource(ref.read(appDioProvider));
    });

@RestApi()
abstract class PreferenceRemoteDataSource {
  factory PreferenceRemoteDataSource(Dio dio) = _PreferenceRemoteDataSource;

  /// 모든 선호도 조회
  @GET('/api/preferences')
  Future<List<PreferenceEntity>> getAllPreferences();
}
