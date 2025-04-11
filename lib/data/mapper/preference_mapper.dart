import 'package:frontend_mobile/data/entity/preference/preference_entity.dart';
import 'package:frontend_mobile/domain/model/preference/preference_model.dart';

extension PreferenceEntityExt on PreferenceEntity {
  PreferenceModel toModel() {
    return PreferenceModel(
      id: id,
      preferenceName: preferenceName,
      preferenceDesc: preferenceDesc,
    );
  }
}
