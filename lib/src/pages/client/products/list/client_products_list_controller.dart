import 'package:get/get.dart';

class ClientProductsListController extends GetxController {
  var indexTab = 0.obs;
  void changeTab(int index) {
    indexTab.value = index;
  }
}
