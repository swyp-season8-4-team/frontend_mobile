import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

/// 이미지 관련 유틸성 모음
abstract class ImageUtil {
  ImageUtil._();

  /// UInt8List -> File
  static Future<File?> uint8ListToFile({
    required Uint8List imageUint8List,
  }) async {
    final Directory tempDir = await getTemporaryDirectory();
    final File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytesSync(imageUint8List);
    return file;
  }
}
