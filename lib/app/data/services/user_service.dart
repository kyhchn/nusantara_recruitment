import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  final dio = Get.find<Dio>();

  Future<void> logout() async {
    try {
      await dio.delete('/api/user/logout');
      final cache = Get.find<SharedPreferences>();
      await cache.remove('token');
    } on DioException catch (e) {
      Get.snackbar('Error', e.message!);
    }
  }

  Future<User?> getUser() async {
    try {
      final response = await dio.get('/api/user');
      final data = response.data;
      if (data != null) {
        return User.fromJson(data);
      }
      return null;
    } on DioException catch (e) {
      Get.snackbar('Error', e.message!);
      return null;
    }
  }
}
