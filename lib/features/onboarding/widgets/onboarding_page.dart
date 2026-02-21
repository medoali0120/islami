import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(onboardingModel.imagePath, width: 400.w),
        SizedBox(height: 50.h),
        (onboardingModel.description == null) ? Spacer() : SizedBox.shrink(),
        Text(
          onboardingModel.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
            color: ColorManger.gold,
          ),
        ),
        SizedBox(height: 40.h),
        (onboardingModel.description == null)
            ? SizedBox.shrink()
            : Text(
                onboardingModel.description!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  color: ColorManger.gold,
                ),
              ),
      ],
    );
  }
}
