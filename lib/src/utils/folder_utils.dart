import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as path;

class FolderUtils {
  FolderUtils._();

  static final instance = FolderUtils._();

  final String _folderName = 'Mintelium';

  /// presentation_structure :: need to change folder name as app name

  Future<String> createFolderInAppDocDir() async {
    //App Document Directory + folder name
    final Directory? dir = await path.getExternalStorageDirectory();
    final Directory appDocDirFolder = Directory('${dir?.path}/$_folderName/');
    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder =
          await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }

  Future<bool> isFileExists(String fileName) async {
    final String dirPath = await createFolderInAppDocDir();
    final File file = File(dirPath + fileName);
    final bool isExist = await file.exists();

    return Future<bool>.value(isExist);
  }

  Future<File> getFile(String fileName) async {
    final String dirPath = await createFolderInAppDocDir();
    final File file = File(dirPath + fileName);
    return Future<File>.value(file);
  }

  String getFileName(String filePath) {
    if (filePath.isNotEmpty && filePath.contains('/')) {
      return filePath.split('/').last;
    } else {
      return '';
    }
  }
}
