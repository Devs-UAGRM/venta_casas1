import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:venta_casas/src/pages/casas/pagos/list/casas_pagos_list.dart';
import 'package:venta_casas/src/pages/catalogo/casas/list/catalogo_casas_list_page.dart';
import 'package:venta_casas/src/pages/client/products/list/client_products_list_controller.dart';
import 'package:venta_casas/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:venta_casas/src/utils/custom_animated_bottom_bar.dart';

class ClientProductsPageList extends StatelessWidget {
  //const ClientProductsPageList({super.key});
  ClientProductsListController con = Get.put(ClientProductsListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Obx(() => 
      IndexedStack(
        index: con.indexTab.value,
        children: [
          CatalogoCasasList(),
          CasasPagosListPage(),
          ClientProfileInfoPage()
        ],)),
      
    );
  }

  Widget _bottomBar() {
    return Obx(() =>  CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: Colors.blueAccent,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        selectedIndex: con.indexTab.value,
        onItemSelected: (index)=>con.changeTab(index),
        items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
               title: Text('Casas'),
               activeColor: Colors.white,
               inactiveColor: Colors.black
               ),
                BottomNavyBarItem(
              icon: Icon(Icons.list),
               title: Text('Pagos'),
                activeColor: Colors.white,
               inactiveColor: Colors.black),
               BottomNavyBarItem(
              icon: Icon(Icons.person),
               title: Text('Perfil'),
                activeColor: Colors.white,
               inactiveColor: Colors.black),
               
        ],));
  }
}
