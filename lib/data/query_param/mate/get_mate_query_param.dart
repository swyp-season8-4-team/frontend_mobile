import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_mate_query_param.g.dart';

@JsonSerializable()
class GetMateQueryParam {
  const GetMateQueryParam({
    required this.from,
    required this.to,
    required this.keyword,
    required this.mateCategoryId,
    required this.recruit,
  });

  final int from;
  final int to;
  final String? keyword;
  final int? mateCategoryId;
  final bool? recruit;

  Map<String, dynamic> toJson() => _$GetMateQueryParamToJson(this);
}
