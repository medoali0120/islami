import 'package:islami/core/resources/assets_manger.dart';

class OnboardingModel {
  final String title;
  final String? description;
  final String imagePath;

  OnboardingModel({
    required this.title,
    this.description,
    required this.imagePath,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: "Welcome To Islmi App",
    imagePath: AssetsManger.onboarding1,
  ),
  OnboardingModel(
    title: "Welcome To Islami",
    description: "We Are Very Excited To Have You In Our Community",
    imagePath: AssetsManger.onboarding2,
  ),
  OnboardingModel(
    title: "Reading the Quran",
    description: "Read, and your Lord is the Most Generous",
    imagePath: AssetsManger.onboarding3,
  ),
  OnboardingModel(
    title: "Bearish",
    description: "Praise the name of your Lord, the Most High",
    imagePath: AssetsManger.onboarding4,
  ),
  OnboardingModel(
    title: "Holy Quran Radio",
    description:
        "You can listen to the Holy Quran Radio through the application for free and easily",
    imagePath: AssetsManger.onboarding5,
  ),
];
