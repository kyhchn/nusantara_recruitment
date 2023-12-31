import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/modules/home/views/books_view.dart';
import 'package:nusantara_recruitment/app/modules/home/views/profile_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.navbarIndex.value,
            children: const [BooksView(), ProfileView()],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.navbarIndex.value,
            onTap: controller.changeNavbarIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ],
          ),
        ));
  }
}
