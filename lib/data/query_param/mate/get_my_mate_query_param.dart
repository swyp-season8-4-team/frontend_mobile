import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_my_mate_query_param.g.dart';

@JsonSerializable()
class GetMyMateQueryParam {
  const GetMyMateQueryParam({required this.from, required this.to});

  final int from;
  final int to;

  Map<String, dynamic> toJson() => _$GetMyMateQueryParamToJson(this);
}
