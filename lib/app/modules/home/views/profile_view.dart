import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/modules/home/controllers/profile_controller.dart';
import 'package:nusantara_recruitment/app/widgets/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.user.value != null
            ? SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.user.value!.name),
                    Text(controller.user.value!.email),
                    SizedBox(
                      width: 30.w,
                      child: DefaultButton(
                          child: Text('Logout'),
                          onPressed: () => controller.logout(),
                          type: Type.warning),
                    )
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.red,
      //   onPressed: controller.logout,
      //   child: const Icon(Icons.logout),
      // ),
    );
  }
}
