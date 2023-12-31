import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/core/theme/typography.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';
import 'package:nusantara_recruitment/app/widgets/button.dart';
import 'package:nusantara_recruitment/app/widgets/form_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/login.jpg',
                    height: 30.h,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: TypographyStyles.h2
                          .copyWith(color: Colors.grey.shade900),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text('Silahkan masukkan email dan password Anda ',
                        style: TypographyStyles.b2
                            .copyWith(color: Colors.grey.shade600)),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                FormInput(
                    validator: FormBuilderValidators.email(),
                    label: 'Alamat Email',
                    hint: 'Masukkan alamat email',
                    inputType: TextInputType.emailAddress,
                    controller: controller.emailController),
                SizedBox(
                  height: 1.5.h,
                ),
                FormInput(
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                    label: 'Kata Sandi',
                    hint: '****',
                    inputType: TextInputType.visiblePassword,
                    controller: controller.passwordController),
                SizedBox(
                  height: 1.5.h,
                ),
                SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => DefaultButton(
                        onPressed: () {
                          if (controller.key.currentState!.validate()) {
                            controller.login();
                          }
                        },
                        type: Type.primary,
                        child: controller.isLoading.value
                            ? SizedBox(
                                width: 2.h,
                                height: 2.h,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Masuk'),
                      ),
                    )),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum punya akun? Silahkan',
                      style: TypographyStyles.b3,
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.REGISTER),
                      child: const Text('Daftar'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
