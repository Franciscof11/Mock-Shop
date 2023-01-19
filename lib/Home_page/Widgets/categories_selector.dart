// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';

final List categories = [
  'Apple',
  'Samsumg',
  'Huawei',
  'OPPO',
];

class _CategoriesSelectorState extends State<CategoriesSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: index == 0 ? Colors.black87 : Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Text(
            categories[index],
            style: TextStyle(
              color: index == 0 ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({super.key});

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}
