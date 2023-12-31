import 'package:get/get.dart';

import '../controllers/bookdetail_controller.dart';

class BookdetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookdetailController>(
      () => BookdetailController(),
    );
  }
}
