import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/services/auth_service.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCofirmationController = TextEditingController();
  final key = GlobalKey<FormState>();
  final isLoading = false.obs;

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

  void register() async {
    isLoading.value = true;
    final isSuccess = await Get.find<AuthService>().register(
        nameController.text,
        emailController.text,
        passwordController.text,
        passwordCofirmationController.text);
    isLoading.value = false;
    if (!isSuccess) return;
    Get.snackbar('Sukses', 'Registrasi berhasil',
        snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed(Routes.LOGIN);
  }

  bool validatePassword() {
    if (passwordController.text != passwordCofirmationController.text) {
      return false;
    }
    return true;
  }

  void increment() => count.value++;
}
