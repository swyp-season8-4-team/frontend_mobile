import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final Provider<FlutterSecureStorage> secureStorageProvider =
    Provider<FlutterSecureStorage>((_) => const FlutterSecureStorage());
