import '../../../../core/localizations/app_strings.g.dart';
import '../../../../core/utils/assets/app_images.dart';

class OnBoardingModel {
  final String title;
  final String description;
  final String mainImage;
  final String smallImage;

  OnBoardingModel({
    required this.title,
    required this.description,
    required this.mainImage,
    required this.smallImage,
  });
}

List<OnBoardingModel> onboardingPages() => [
  OnBoardingModel(
    title: AppStrings.trackYourCycle,
    description: AppStrings.trackYourCycleDescription,
    mainImage: AppImages.logo,
    smallImage: AppImages.profileOnBoarding1,
  ),
  OnBoardingModel(
    title: AppStrings.knowYourFertility,
    description: AppStrings.knowYourFertilityDescription,
    mainImage: AppImages.logo,
    smallImage: AppImages.profileOnBoarding2,
  ),
  OnBoardingModel(
    title: AppStrings.logSymptomsAndMood,
    description: AppStrings.logSymptomsAndMoodDescription,
    mainImage: AppImages.logo,
    smallImage: AppImages.profileOnBoarding3,
  ),
];
