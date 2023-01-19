// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 22),
        SvgPicture.asset(
          'assets/icons/app_bar_menu_icon.svg',
        ),
        SizedBox(width: 50),
        Container(
          width: 270,
          constraints: BoxConstraints(
            maxHeight: 50,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(144, 149, 166, 0.5),
                  ),
                  borderRadius: BorderRadius.circular(40)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              hintText: 'Search Product',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(27, 21, 61, 0.55),
              ),
              labelStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SvgPicture.asset(
                  'assets/icons/app_bar_search_icon.svg',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
