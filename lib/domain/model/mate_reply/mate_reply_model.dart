import 'package:frontend_mobile/domain/model/mate_reply/mate_reply_detail_model.dart';

class MateReplyModel {
  MateReplyModel({
    required this.mateReplies,
    required this.count,
    required this.last,
  });

  final List<MateReplyDetailModel> mateReplies;
  final int count;
  final bool last;
}
