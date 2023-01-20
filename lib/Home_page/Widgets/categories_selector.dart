// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers

import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';

class _CategoriesSelectorState extends State<CategoriesSelector> {
  TextStyle categoriesStyle = TextStyle(
    fontFamily: 'Raleway-Bold',
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
          width: 500,
          height: 60,
          child: DefaultTabController(
              length: 4,
              animationDuration: Duration(milliseconds: 200),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 56,
                      child: TabBar(
                        onTap: (value) => render(value),
                        labelPadding: EdgeInsets.only(left: 0),
                        unselectedLabelColor: Colors.grey,
                        labelColor: Color.fromRGBO(146, 39, 143, 1),
                        automaticIndicatorColorAdjustment: true,
                        tabs: [
                          Text('Apple', style: categoriesStyle),
                          Text('Samsumg', style: categoriesStyle),
                          Text('Huawei', style: categoriesStyle),
                          Text('OPPO', style: categoriesStyle),
                        ],
                        indicator: ContainerTabIndicator(
                            height: 3,
                            padding: EdgeInsets.only(top: 20),
                            width: 40,
                            color: Color.fromRGBO(146, 39, 143, 1)),
                      ),
                    ),
                  ]))),
    );
  }

  render(value) {
    switch (value) {
      case 0:
        print('Apple');
        return 'Apple';
      case 1:
        print('Samsung');
        return 'Samsung';
      case 2:
        print('Huawei');
        return 'Huawei';
      case 3:
        print('OPPO');
        return 'OPPO';
    }
  }
}

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({super.key});

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}
