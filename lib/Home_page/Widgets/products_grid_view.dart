import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockshop/Home_page/Widgets/remove_glow_effet.dart';

import '../../Routes/routes.dart';
import '../../Services/Home_page/products_controller.dart';
import '../../consts.dart';

class _ProductsGridViewState extends State<ProductsGridView> {
  final ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return RemoveGlowEffect(
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: productsController.products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () =>
                Get.toNamed(RoutesClass.productDatailsPage, arguments: index),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 100,
                width: 150,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    )),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14)),
                        image: DecorationImage(
                          image: NetworkImage(
                              productsController.products[index]["images"][0]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              productsController.products[index]["title"],
                              style: productNameStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: Text(
                                productsController.products[index]["category"],
                                style: productCategoryStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "\$${productsController.products[index]["price"]}",
                              style: productPriceStyle,
                            ),
                            const SizedBox(height: 2),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}
