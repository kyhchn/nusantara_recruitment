import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/models/user.dart';
import 'package:nusantara_recruitment/app/data/services/user_service.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';

class HomeController extends GetxController {
  Rxn<User> user = Rxn<User>();
  final navbarIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    checkUser();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkUser() async {
    final user = await Get.find<UserService>().getUser();
    if (user == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      this.user.value = user;
    }
  }

  void changeNavbarIndex(int index) {
    navbarIndex.value = index;
  }
}
