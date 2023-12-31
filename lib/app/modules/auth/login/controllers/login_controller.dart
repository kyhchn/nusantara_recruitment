import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/services/auth_service.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final key = GlobalKey<FormState>();

  final count = 0.obs;
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

  void login() async {
    isLoading.value = true;
    final isSuccess = await Get.find<AuthService>()
        .login(emailController.text, passwordController.text);
    isLoading.value = false;
    if (!isSuccess) return;
    Get.offAllNamed(Routes.HOME);
  }

  void increment() => count.value++;
}
