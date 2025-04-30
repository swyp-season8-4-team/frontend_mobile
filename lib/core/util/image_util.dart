import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

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

  /// download image url -> File
  static Future<File?> downloadImageUrlToFile(String imageUrl) async {
    final Dio dio = Dio();

    try {
      // 임시 디렉토리 가져오기
      final Directory tempDir = await getTemporaryDirectory();
      final String fileName = path.basename(imageUrl);
      final String filePath = path.join(tempDir.path, fileName);

      // 다운로드 시도
      final Response<dynamic> response = await dio.download(
        imageUrl,
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        return File(filePath);
      } else {
        return null;
      }
    } on DioException {
      return null;
    } on FileSystemException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
