import 'package:frontend_mobile/core/resource/model.dart';
import 'package:frontend_mobile/core/resource/repository.dart';
import 'package:frontend_mobile/core/resource/result/result.dart';

abstract class Usecase<T extends Repository> {
  Future<Result<Model>> call({required T repository});
}
