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
      backgroundColor: Colors.white,
      /* Color.fromRGBO(249, 249, 252, 1), */
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            HomeAppBar(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Find your Product',
                style: textStyle,
              ),
            ),
            SizedBox(height: 4),
            CategoriesSelector(),
            Expanded(
              child: Obx(
                () {
                  if (productsController.loading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (productsController.products.isEmpty) {
                    return Center(child: Text("No products found!"));
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
