import 'package:flutter/material.dart';
import 'package:mr_candy/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 111,
      width:  double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        gradient: LinearGradient(colors: [
          AppColors.lavender2,
          AppColors.lavender
        ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ),

      ),
      child:  AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.white,)),
        ],
        title: Text(name,style: TextStyle(color: AppColors.white,fontSize: 25),),
        backgroundColor: Colors.transparent,
      )

    );
  }
}
