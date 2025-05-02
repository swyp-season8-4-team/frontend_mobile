import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';

part 'generated/mate_model.freezed.dart';

@freezed
class MateModel with _$MateModel {
  const factory MateModel({
    required List<MateDetailModel> mates,
    required bool last,
  }) = _MateModel;
}
