import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/block_user_request_body.g.dart';

@JsonSerializable(includeIfNull: false)
class BlockUserRequestBody {
  BlockUserRequestBody({required this.blockedUserUuid});

  final String? blockedUserUuid;

  Map<String, dynamic> toJson() => _$BlockUserRequestBodyToJson(this);
}
