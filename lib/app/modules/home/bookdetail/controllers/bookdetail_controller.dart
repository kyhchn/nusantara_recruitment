import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/models/book.dart';
import 'package:nusantara_recruitment/app/data/services/book_service.dart';
import 'package:nusantara_recruitment/app/modules/home/controllers/books_controller.dart';
import 'package:nusantara_recruitment/app/modules/home/controllers/home_controller.dart';

class BookdetailController extends GetxController {
  final Rx<Book> book = Rx(Get.arguments);
  final BooksController booksController = Get.find<BooksController>();
  void refetch() async {
    final result = await Get.find<BookService>().getBook(book.value.id);
    if (result != null) {
      book.value = result;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    refetch();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void deleteBook() async {
    final result = await Get.find<BookService>().deleteBook(book.value.id);
    if (result) {
      Get.back();
      Get.snackbar('Success', 'Book deleted');
      booksController.fetchBook();
    }
  }
}
