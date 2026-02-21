import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/resources/assets_manger.dart';
import 'package:islami/core/resources/color_manger.dart';
import 'package:islami/core/route_manger/route_manger.dart';
import 'package:islami/features/onboarding/widgets/custom_taxt_button.dart';
import 'package:islami/features/onboarding/widgets/dotindicator.dart';
import 'package:islami/features/onboarding/widgets/onboarding_page.dart';
import 'package:islami/models/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      currentIndex = _pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AssetsManger.islamiLogo, width: 300),
            SizedBox(height: 50.h),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) =>
                    OnboardingPage(onboardingModel: onboardingData[index]),
              ),
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentIndex == 0
                        ? SizedBox.shrink()
                        : CustomTaxtButton(
                            text: "Back",
                            onPressed: () {
                              currentIndex--;
                              _pageController.animateToPage(
                                currentIndex,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),

                    CustomTaxtButton(
                      text: "Next",
                      onPressed: () {
                        currentIndex == 4 ? _seenOnboarding() : currentIndex++;
                        _pageController.animateToPage(
                          currentIndex,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => Dotindicator(isActive: index == currentIndex),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _seenOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("FirstTime", false);
    Navigator.pushReplacementNamed(context, RouteManger.mainLayout);
  }
}
