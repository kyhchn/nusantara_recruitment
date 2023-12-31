import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/models/book.dart';

class BookService {
  final _dio = Get.find<Dio>();

  Future<(int, List<Book>)?> getBooks() async {
    try {
      final response = await _dio.get('/api/books');
      final data = response.data;
      if (data != null) {
        final books = (data['data'] as List)
            .map((e) => Book.fromJson(e))
            .toList(growable: false);
        return (data['total'] as int, books);
      }
      return (null);
    } on DioException catch (e) {
      Get.snackbar('Error', 'Error when get books');
    }
    return null;
  }

  Future<List<Book>?> getBooksByPage(int page) async {
    try {
      final response = await _dio.get('/api/books?page=$page');
      final data = response.data;
      if (data != null) {
        final books = (data['data'] as List)
            .map((e) => Book.fromJson(e))
            .toList(growable: false);
        return books;
      }
      return null;
    } on DioException catch (e) {
      Get.snackbar('Error', 'Error when get books');
    }
    return null;
  }

  Future<Book?> getBook(int id) async {
    try {
      final response = await _dio.get('/api/books/$id');
      final data = response.data;
      if (data != null) {
        return Book.fromJson(data);
      }
      return null;
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message']);
    }
    return null;
  }

  Future<bool> deleteBook(int id) async {
    try {
      await _dio.delete('/api/books/$id');
      return true;
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message']);
      return false;
    }
  }

  Future<Book?> updateBook(Book book) async {
    try {
      final response =
          await _dio.put('/api/books/${book.id}/edit', data: book.toJson());
      final data = response.data['book'];
      if (data != null) {
        return Book.fromJson(data);
      }
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message']);
    }
    return null;
  }

  Future<Book?> addBook(
      String isbn,
      String title,
      String subtitle,
      String author,
      String published,
      String publisher,
      String pages,
      String description,
      String website) async {
    try {
      final response = await _dio.post('/api/books/add', data: {
        'isbn': isbn,
        'title': title,
        'subtitle': subtitle,
        'author': author,
        'published': published,
        'publisher': publisher,
        'pages': pages,
        'description': description,
        'website': website
      });
      final data = response.data['book'];
      if (data != null) {
        return Book.fromJson(data);
      }
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message']);
    }
    return null;
  }
}
