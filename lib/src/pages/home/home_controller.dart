import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venta_casas/src/pages/models/user.dart';

class HomeController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  HomeController() {
    print('Usuario de sesion: ${user.toJson()}');
  }
  void signOut() {
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }
}
