import 'package:get/get.dart';

import '../controllers/bookform_controller.dart';

class BookformBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookformController>(
      () => BookformController(),
    );
  }
}
