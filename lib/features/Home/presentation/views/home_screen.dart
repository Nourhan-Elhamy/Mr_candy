import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/features/Home/presentation/views/widgets/home_body.dart';
import 'package:mr_candy/features/cart/presentation/views/cart_screen.dart';
import 'package:mr_candy/features/favorite/presentation/views/favorite_screen.dart';

import '../../../../core/utils/app_images.dart';


class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int currentIndex=0;

  final List<Widget> lst=[
    HomeBody(),
    CartScreen(),
    FavoriteScreen(),
    FavoriteScreen(),


  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          body: lst[currentIndex],

      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: ClipRRect(

            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),

          ),
          child: BottomNavigationBar(
            onTap: (index){
              currentIndex=index;
              setState(() {
              });
            },
            currentIndex: currentIndex,
            unselectedItemColor: AppColors.white,
            selectedItemColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.lavender,
            items: [

              BottomNavigationBarItem(
              icon: Icon(currentIndex ==0 ?Icons.home:Icons.home_outlined
              ),
              label: 'الاعدادات',
            ),


            BottomNavigationBarItem(
              icon: Icon(currentIndex==1? Icons.shopping_bag:Icons.shopping_bag_outlined),
              label: 'السلة',
            ),


              BottomNavigationBarItem(
                icon: Icon(currentIndex == 2?Icons.favorite: Icons.favorite_border
               ),
                label: 'المفضلة',
              ),

              BottomNavigationBarItem(
                icon: Icon(currentIndex ==3?Icons.settings: Icons.settings_outlined
                 ),
                label: 'الاقسام',
              ),


          ],),
        ),
      ),
    );
  }
}
