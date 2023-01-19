// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockshop/Home_page/Widgets/categories_selector.dart';

import '../../Services/Products_controller.dart';
import '../Widgets/app_bar.dart';
import '../Widgets/products_grid_view.dart';

class HomeView extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontFamily: 'Raleway-Bold',
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: Color.fromRGBO(27, 21, 61, 1),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            HomeAppBar(),
            SizedBox(height: 20),
            Text(
              'Find your Product',
              style: textStyle,
            ),
            CategoriesSelector(),
            Expanded(
              child: Obx(
                () {
                  if (productsController.loading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (productsController.products.isEmpty) {
                    return Center(child: Text("No products found"));
                  }
                  return ProductsGridView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
