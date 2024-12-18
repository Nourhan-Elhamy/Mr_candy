import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hinttext, required this.icon, required this.controller});

final String hinttext;
final  IconData icon;


final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textDirection: TextDirection.rtl,
      onTapOutside: (e){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        prefixIcon: Icon(icon,color: AppColors.lavender,),
        hintText: hinttext,hintStyle: TextStyle(color: AppColors.lavender),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lavender)
        ),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.lavender)
        ),

      ),
    );
  }
}
