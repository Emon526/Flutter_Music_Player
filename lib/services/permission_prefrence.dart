import 'package:permission_handler/permission_handler.dart';

class PermissionSettings {
  // request storage permission
  static bool isPermit = false;
  static Future<bool> promptPermissionSetting() async {
    if (await Permission.storage.request().isGranted) {
      isPermit = true;
      return true;
    } else {
      isPermit = false;
      return false;
    }
  }
}
