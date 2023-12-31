import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/models/book.dart';
import 'package:nusantara_recruitment/app/data/services/book_service.dart';

class BooksController extends GetxController {
  RxList books = <Book>[].obs;
  int _index = 1;
  int _max = 1;
  final hasMore = true.obs;
  final isLoading = false.obs;
  final bookService = Get.find<BookService>();
  final scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchBook();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchBook() async {
    isLoading(true);
    final result = await bookService.getBooks();
    if (result != null) {
      books.assignAll(result.$2);
      _max = result.$1;
      _index = 1;
      hasMore.value = _index < _max;
    }
    isLoading(false);
  }

  void fetchBookByPage() async {
    isLoading(true);
    final result = await bookService.getBooksByPage(_index);
    if (result != null) {
      books.addAll(result);
    }
    isLoading(false);
  }

  void nextPage() {
    if (hasMore.value) {
      _index++;
      hasMore.value = _index < _max;
      fetchBookByPage();
    }
  }
}
