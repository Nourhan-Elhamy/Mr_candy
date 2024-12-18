import 'package:flutter/material.dart';
import 'package:mr_candy/core/utils/app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [

      Image.asset(AppImages.splash,width: 100,height: 73,)
    ],);
  }
}
