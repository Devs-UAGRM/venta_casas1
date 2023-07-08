import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:venta_casas/src/pages/casas/pagos/list/casas_pagos_list.dart';
import 'package:venta_casas/src/pages/catalogo/casas/list/catalogo_casas_list_page.dart';
import 'package:venta_casas/src/pages/client/products/list/client_products_list_page.dart';
import 'package:venta_casas/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:venta_casas/src/pages/home/home_page.dart';
import 'package:venta_casas/src/pages/login/login_page.dart';
import 'package:venta_casas/src/pages/models/user.dart';
import 'package:venta_casas/src/pages/register/register_page.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {});

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    print('Usuario id: ${userSession.id}');
    return GetMaterialApp(
      //ocupa las funcionalidades de Get
      title: 'VENTA CASAS',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null ? '/' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/casas/pagos/list', page:()=> CasasPagosListPage()),
         GetPage(name: '/catalogo/casas/list', page:()=> CatalogoCasasList()),  
        GetPage(name: '/client/products/list', page:()=> ClientProductsPageList()),
        GetPage(name: '/client/profile/info', page:()=> ClientProfileInfoPage())
      ],
      navigatorKey: Get.key,
    );
  }
}
