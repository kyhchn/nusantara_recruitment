import 'package:get/get.dart';

import 'package:nusantara_recruitment/app/modules/home/controllers/books_controller.dart';
import 'package:nusantara_recruitment/app/modules/home/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BooksController>(
      () => BooksController(),
    );
    Get.put<HomeController>(HomeController());
    Get.lazyPut(() => ProfileController());
  }
}
