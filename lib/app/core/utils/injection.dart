import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/constant/constant.dart';
import 'package:nusantara_recruitment/app/data/services/auth_service.dart';
import 'package:nusantara_recruitment/app/data/services/book_service.dart';
import 'package:nusantara_recruitment/app/data/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injection() async {
  final cache = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(cache);
  Get.put(Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      headers: {
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${Get.find<SharedPreferences>().getString('token') ?? ''}'
      },
    ),
  ));

  Get.put(UserService());
  Get.put(AuthService());
  Get.put(BookService());
}
