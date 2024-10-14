import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onpressed, required this.text});
final void Function()? onpressed;
final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      onPressed: onpressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
      ),
      color: AppColors.lavender,
      child: Text(text,style: TextStyle(color: AppColors.white),),);
  }
}
