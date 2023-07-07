import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venta_casas/src/pages/casas/pagos/list/casas_pagos_list_controller.dart';

class CasasPagosListPage extends StatelessWidget {
  // const CasasPagosListPage({super.key});
  CasasPagosListController con = Get.put(CasasPagosListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Pagos de casa'),
      ),
    );
  }
}
