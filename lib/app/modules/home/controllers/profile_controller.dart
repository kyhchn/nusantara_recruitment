import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/models/user.dart';
import 'package:nusantara_recruitment/app/data/services/user_service.dart';
import 'package:nusantara_recruitment/app/modules/home/controllers/home_controller.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  Rxn<User> user = Get.find<HomeController>().user;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void logout() async {
    await Get.find<UserService>().logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
