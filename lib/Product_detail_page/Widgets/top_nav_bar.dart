import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TopNovBar extends StatelessWidget {
  const TopNovBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          const SizedBox(width: 30),
          GestureDetector(
            onTap: () => Get.back(),
            child: SvgPicture.asset(
              'assets/icons/arrow_back_icon.svg',
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 260),
          SvgPicture.asset(
            'assets/icons/favorite_icon.svg',
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
