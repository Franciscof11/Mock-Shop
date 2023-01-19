// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockshop/Home_page/Widgets/categories_selector.dart';

import '../../Services/Products_controller.dart';
import '../Widgets/app_bar.dart';

class HomeView extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  final List categories = [
    "TShirt",
    "Pants",
    "Jeans",
    "Jackets",
    "Shirt",
  ];

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
                  if (productsController.showGrid.value) {
                    return GridView.builder(
                      padding: EdgeInsets.only(top: 16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: productsController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0.0,
                          child: Container(
                            height: 150,
                            padding: EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(productsController
                                          .products[index]["images"][0]),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productsController.products[index]
                                              ["title"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Expanded(
                                          child: Text(
                                            productsController.products[index]
                                                ["description"],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "\$${productsController.products[index]["price"]}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return _buildProductsList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildProductsList() {
    return ListView.builder(
      itemCount: productsController.products.length,
      padding: EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: Container(
          height: 120,
          padding: EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        productsController.products[index]["images"][0]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsController.products[index]["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          productsController.products[index]["description"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${productsController.products[index]["price"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/* import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/products_controller.dart';
import '../Widgets/app_bar.dart';
import '../Widgets/categories_selector.dart';
import '../Widgets/products_list_view.dart';

class HomePage extends GetView<ProductsController> {
  const HomePage({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              HomeAppBar(),
              SizedBox(height: 24),
              Text(
                'Find your Product',
                style: textStyle,
              ),
              SizedBox(height: 12),
              CategoriesSelector(),
              SizedBox(height: 24),
              ProductsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
 */