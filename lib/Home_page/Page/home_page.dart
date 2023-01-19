// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/products_controller.dart';
import '../Widgets/app_bar.dart';

class HomePage extends GetView<ProductsController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              HomeAppBar(),
              Text('HOME'),
            ],
          ),
        ),
      ),
    );
  }
}
