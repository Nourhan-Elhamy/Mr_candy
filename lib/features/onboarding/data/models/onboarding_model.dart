import 'package:mr_candy/core/utils/app_images.dart';
import 'package:mr_candy/core/utils/app_text.dart';

class OnboardingModel{
  
  final String image;
  final String title;
  final String descr;
  final String textbutton;

  
  OnboardingModel({
  required this.image,
    required this.title,
    required this.descr,
    required this.textbutton
  });
}

List<OnboardingModel> onboardingmodel=[
  OnboardingModel(image: AppImages.image1, title: AppTexts.onboardingtitle1, descr: AppTexts.onboardingdesc1, textbutton: "التالي"),
  OnboardingModel(image: AppImages.image2, title: AppTexts.onboardingtitle2, descr: AppTexts.onboardingdesc1, textbutton: "التالي"),
  OnboardingModel(image: AppImages.image3, title: AppTexts.onboardingtitle3, descr: AppTexts.onboardingdesc1, textbutton: "ابدأ")
]; 