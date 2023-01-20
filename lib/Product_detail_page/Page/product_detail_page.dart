import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Services/Product_detail_page/products_details_controller.dart';
import '../../consts.dart';
import '../Widgets/top_nav_bar.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ProductsDetailsController productsDetailsController =
      Get.put(ProductsDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 252, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const TopNovBar(),
            const SizedBox(height: 38),
            Expanded(
              child: Obx(
                () {
                  if (productsDetailsController.loading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var index = Get.arguments;
                  return Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          Center(
                            child: Container(
                              height: 225,
                              width: 311,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(14)),
                                image: DecorationImage(
                                  image: NetworkImage(productsDetailsController
                                      .products[index]["images"][0]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 55),
                          Row(
                            children: [
                              const SizedBox(width: 25),
                              SizedBox(
                                width: 220,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productsDetailsController.products[index]
                                          ["title"],
                                      style: productDetailsNameStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      productsDetailsController.products[index]
                                          ["category"],
                                      style: productDetailsCategoryStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 40),
                              Text(
                                "\$${productsDetailsController.products[index]["price"]}",
                                style: productDetailsPriceStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  productsDetailsController.products[index]
                                      ["brand"],
                                  style: productBrandStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 45),
                          Row(
                            children: [
                              const SizedBox(width: 25),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Details',
                                        style: productDetailsStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 3),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: SvgPicture.asset(
                                          'assets/icons/line_pink_icon.svg',
                                          height: 3,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              productsDetailsController.products[index]
                                  ["description"],
                              style: productDetailsCategoryStyle,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 42),
                          Center(
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                width: 335,
                                height: 71,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(161, 68, 159, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(
                                  child: Text(
                                    'Add to cart',
                                    style: buttonsStyle,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
