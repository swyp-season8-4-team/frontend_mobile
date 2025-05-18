import 'package:frontend_mobile/domain/model/user/blocked_user_model.dart';

class BlockedUserListModel {
  const BlockedUserListModel({
    required this.blockedUsers,
    required this.totalCount,
  });
  final List<BlockedUserModel> blockedUsers;
  final int totalCount;
}
