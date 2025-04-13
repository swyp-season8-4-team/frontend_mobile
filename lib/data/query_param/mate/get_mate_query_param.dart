import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_mate_query_param.g.dart';

@JsonSerializable()
class GetMateQueryParam {
  const GetMateQueryParam({
    required this.keyword,
    required this.mateCategoryId,
  });

  final String? keyword;
  final int? mateCategoryId;

  Map<String, dynamic> toJson() => _$GetMateQueryParamToJson(this);
}
