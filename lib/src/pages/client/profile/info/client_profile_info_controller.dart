import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venta_casas/src/pages/models/user.dart';

class ClientProfileIngoController extends GetxController {
  User user = User.fromJson(GetStorage().read('user'));
}
