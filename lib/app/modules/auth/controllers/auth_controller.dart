import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    checkAuth();
  }

  Future<void> checkAuth() async {
    final cache = Get.find<SharedPreferences>();
    final token = cache.getString('token');
    if (token != null) {
      await Get.offAllNamed(Routes.HOME);
    } else {
      await Get.offAllNamed(Routes.LOGIN);
    }
  }
}
