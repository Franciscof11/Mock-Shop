// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Services/Products_controller.dart';
import '../Widgets/top_nav_bar.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  final TextStyle productNameStyle = TextStyle(
    fontFamily: 'Raleway-Bold',
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: Colors.black,
  );
  final TextStyle productCategoryStyle = TextStyle(
    fontFamily: 'Raleway-Bold',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color.fromRGBO(144, 149, 166, 1),
  );
  final TextStyle productPriceStyle = TextStyle(
    fontFamily: 'Raleway-Bold',
    fontWeight: FontWeight.w500,
    fontSize: 25,
    color: Color.fromRGBO(146, 39, 143, 1),
  );
  final TextStyle productBrandStyle = TextStyle(
    fontFamily: 'Raleway-Bold',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Colors.black,
  );
  final TextStyle productDetailsStyle = TextStyle(
    fontFamily: 'Raleway-Bold',
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: Color.fromRGBO(146, 39, 143, 1),
  );
  final TextStyle buttonsStyle = TextStyle(
    fontFamily: 'Raleway-Bold',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: Colors.white,
  );
  ProductDetailPage({super.key});

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
            TopNovBar(),
            SizedBox(height: 38),
            Center(
              child: Container(
                height: 225,
                width: 311,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  image: DecorationImage(
                    image: NetworkImage(
                        productsController.products[5]["images"][0]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 55),
            Row(
              children: [
                SizedBox(width: 25),
                Column(
                  children: [
                    Text(
                      productsController.products[0]["title"],
                      style: productNameStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      productsController.products[0]["category"],
                      style: productCategoryStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                SizedBox(width: 165),
                Text(
                  "\$${productsController.products[0]["price"]}",
                  style: productPriceStyle,
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                productsController.products[0]["brand"],
                style: productBrandStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 45),
            Row(
              children: [
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Details',
                          style: productDetailsStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: SvgPicture.asset(
                            'assets/icons/line_pink_icon.svg',
                            height: 3,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                productsController.products[2]["description"],
                style: productCategoryStyle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 42),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 335,
                  height: 71,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(161, 68, 159, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      'Add to cart',
                      style: buttonsStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
