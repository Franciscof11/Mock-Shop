// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/Products_controller.dart';

class _ProductsGridViewState extends State<ProductsGridView> {
  final ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(top: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
}

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}
