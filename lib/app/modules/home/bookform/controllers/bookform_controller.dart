import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/models/book.dart';
import 'package:nusantara_recruitment/app/data/services/book_service.dart';
import 'package:nusantara_recruitment/app/modules/home/controllers/books_controller.dart';
import 'package:nusantara_recruitment/app/modules/home/controllers/home_controller.dart';

class BookformController extends GetxController {
  final isbnController = TextEditingController();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final authorController = TextEditingController();
  final publishedController = TextEditingController().obs;
  final publisherController = TextEditingController();
  final pagesController = TextEditingController();
  final descriptionController = TextEditingController();
  final websiteController = TextEditingController();
  final key = GlobalKey<FormState>();
  final BooksController booksController = Get.find<BooksController>();

  final isLoading = false.obs;
  final bookService = Get.find<BookService>();

  void datePicker() async {
    final result = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (result != null) {
      publishedController.value.text =
          '${result.year.toString().padLeft(4, '0')}-${result.month.toString().padLeft(2, '0')}-${result.day.toString().padLeft(2, '0')}';
    }
  }

  void setFieldFromObject(Book book) {
    isbnController.text = book.isbn;
    titleController.text = book.title;
    subtitleController.text = book.subtitle;
    authorController.text = book.author;
    publishedController.value.text =
        '${book.published.year.toString().padLeft(4, '0')}-${book.published.month.toString().padLeft(2, '0')}-${book.published.day.toString().padLeft(2, '0')}';
    publisherController.text = book.publisher;
    pagesController.text = book.pages.toString();
    descriptionController.text = book.description;
    websiteController.text = book.website;
  }

  Future<bool> addBook(
      String isbn,
      String title,
      String subtitle,
      String author,
      String published,
      String publisher,
      String pages,
      String description,
      String website) async {
    isLoading(true);
    final book = await bookService.addBook(isbn, title, subtitle, author,
        published, publisher, pages, description, website);
    if (book != null) {
      booksController.fetchBook();
      return true;
    }
    isLoading(false);
    return false;
  }

  Future<bool> updateBook(Book targetBook) async {
    final book = Book(
        isbn: isbnController.text,
        title: titleController.text,
        subtitle: subtitleController.text,
        author: authorController.text,
        published: DateTime.parse(publishedController.value.text),
        publisher: publisherController.text,
        pages: int.parse(pagesController.text),
        description: descriptionController.text,
        website: websiteController.text,
        userId: targetBook.userId,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
        id: targetBook.id);
    isLoading(true);
    try {
      final result = await bookService.updateBook(book);
      if (result != null) {
        booksController.fetchBook();
        return true;
      }
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message']);
      isLoading(false);
      return false;
    }
    isLoading(false);
    return false;
  }
}
