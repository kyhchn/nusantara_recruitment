import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final dio = Get.find<Dio>();

  Future<bool> login(String email, String password) async {
    try {
      final response = await dio
          .post('/api/login', data: {'email': email, 'password': password});
      final data = response.data['token'];
      if (data != null) {
        final cache = Get.find<SharedPreferences>();
        await cache.setString('token', data);

        dio.options.headers['Authorization'] = 'Bearer $data';
        return true;
      }
      return false;
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message']!,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  Future<bool> register(String name, String email, String password,
      String passwordConfirm) async {
    try {
      final response = await dio.post('/api/register', data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirm
      });
      final data = response.data['user'];
      if (data != null) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      Get.snackbar('Error', e.response?.data['message']!);
      return false;
    }
  }
}
