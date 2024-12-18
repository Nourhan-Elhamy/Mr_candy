import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/core/utils/app_images.dart';
import 'package:mr_candy/features/onboarding/presentation/views/widgets/onboarding_body.dart';

import '../../../Home/presentation/views/home_screen.dart';
import '../../../onboarding/presentation/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Future.delayed(Duration(
      seconds: 3
    ),
        (){
      Navigator.push(context,MaterialPageRoute(builder: (c){

        return Hive.box("setting").get("token")==null?
        OnboardingScreen():
            HomeScreen();

      }));
        }
    );

  }
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Container(

         decoration: BoxDecoration(
           gradient: LinearGradient(
               colors: [
             AppColors.lavender,
                 AppColors.lavender2,
           ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter

           )
         ),
       child: Center(
           child: Image.asset(AppImages.splash)
       ),
     ),
    );
  }
}
