import 'package:flutter/material.dart';
import 'package:islami/features/main_layout/main_layout_screen.dart';
import 'package:islami/features/onboarding/onboarding_screen.dart';
import 'package:islami/features/sura_details/sura_details.dart';

class RouteManger {
  static const String mainLayout = '/mainLayoutScreen';
  static const String suraDetails = '/suraDetailsScreen';
  static const String onBoardingScreen = '/onBoardingScreen';

  static Map<String, WidgetBuilder> routes = {
    mainLayout: (_) => MainLayoutScreen(),
    suraDetails: (_) => SuraDetails(),
    onBoardingScreen: (_) => OnboardingScreen(),
  };
}
