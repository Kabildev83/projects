import 'package:get_storage/get_storage.dart';

class StorageService {
  final box = GetStorage();

  Future<void> saveLoginDetails(String email, String password, bool rememberMe) async {
    await box.write('email', email);
    await box.write('password', password);
    await box.write('rememberMe', rememberMe);
  }

  String? getStoredEmail() {
    return box.read('email');
  }

  String? getStoredPassword() {
    return box.read('password');
  }

  bool? getRememberMe() {
    return box.read('rememberMe');
  }
}
