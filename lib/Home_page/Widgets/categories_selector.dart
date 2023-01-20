import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';

class _CategoriesSelectorState extends State<CategoriesSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
          width: 500,
          height: 60,
          child: DefaultTabController(
              length: 4,
              animationDuration: const Duration(milliseconds: 200),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 56,
                      child: TabBar(
                        onTap: (value) => {},
                        labelPadding: const EdgeInsets.only(left: 0),
                        unselectedLabelColor: Colors.grey,
                        labelColor: const Color.fromRGBO(146, 39, 143, 1),
                        automaticIndicatorColorAdjustment: true,
                        tabs: [
                          Text('Apple', style: categoriesStyle),
                          Text('Samsumg', style: categoriesStyle),
                          Text('Huawei', style: categoriesStyle),
                          Text('OPPO', style: categoriesStyle),
                        ],
                        indicator: const ContainerTabIndicator(
                            height: 3,
                            padding: EdgeInsets.only(top: 20),
                            width: 40,
                            color: Color.fromRGBO(146, 39, 143, 1)),
                      ),
                    ),
                  ]))),
    );
  }
}

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({super.key});

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}
