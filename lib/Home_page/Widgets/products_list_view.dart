// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/Products_controller.dart';

class _ProductsListViewState extends State<ProductsListView> {
  final ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
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
                        productsController.products[index]["image"]),
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

class ProductsListView extends StatefulWidget {
  const ProductsListView({super.key});

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}
