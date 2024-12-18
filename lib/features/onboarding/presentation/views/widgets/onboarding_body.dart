import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy/core/shared_widgets/text_button.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/core/utils/app_fonts.dart';
import 'package:mr_candy/core/utils/app_images.dart';
import 'package:mr_candy/core/utils/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../../../login/presentation/views/login_screen.dart';
import '../../../data/models/onboarding_model.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
     itemCount: onboardingmodel.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Image.asset(AppImages.onboarding,width: double.infinity,fit: BoxFit.cover,),
            Positioned(
              top: MediaQuery.of(context).size.height*0.1,
                left: MediaQuery.of(context).size.width*0.1,
                 right:  MediaQuery.of(context).size.width*0.1,
                child: Image.asset(onboardingmodel[index].image)),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 300,),
                  Text(onboardingmodel[index].title,style: TextStyle(color: AppColors.lavender),),
                  SizedBox(height: 30,),

                  Text(AppTexts.onboardingdesc1,style: TextStyle(color: AppColors.grey),),
                  SizedBox(height: 20,),

                  SmoothPageIndicator(
                    controller: pageController,
                      count: onboardingmodel.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.lavender,
                      dotColor: AppColors.grey,
                      dotHeight: 6,
                      dotWidth: 6,

                    ),
                  ),
                  SizedBox(height: 20,),
                  CustomTextButton(

                    text:onboardingmodel[index].textbutton,
                    onpressed: (){

                      if(index==onboardingmodel.length-1){
                        Navigator.push(context, MaterialPageRoute(builder: (c){
                          return LoginScreen();
                        }));
                      }else{
                        pageController.animateToPage(
                            index+1,
                            duration: Duration(seconds: 1), curve: Curves.linear);
                      }
                    },

                    ),

                ],),
            )
          ],
        );
      }
    );
  }
}
