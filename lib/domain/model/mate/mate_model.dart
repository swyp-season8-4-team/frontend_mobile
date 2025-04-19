import 'package:frontend_mobile/domain/model/mate/mate_detail_model.dart';

class MateModel {
  const MateModel({required this.mates, required this.last});

  final List<MateDetailModel> mates;
  final bool last;
}
