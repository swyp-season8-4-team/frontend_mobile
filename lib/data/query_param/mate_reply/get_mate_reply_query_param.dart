import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/get_mate_reply_query_param.g.dart';

@JsonSerializable()
class GetMateReplyQueryParam {
  const GetMateReplyQueryParam({required this.from, required this.to});

  final int from;
  final int to;

  Map<String, dynamic> toJson() => _$GetMateReplyQueryParamToJson(this);
}
