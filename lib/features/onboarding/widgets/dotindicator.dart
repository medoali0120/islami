import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/color_manger.dart';

class Dotindicator extends StatelessWidget {
  const Dotindicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 24.w : 8.w,
      height: 8.h,
      margin: REdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.r),
        color: isActive ? ColorManger.gold : ColorManger.darkGrey,
      ),
    );
  }
}
