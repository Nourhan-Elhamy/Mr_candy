

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mr_candy/core/utils/app_fonts.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo_implementation.dart';
import 'package:mr_candy/features/Home/presentation/controller/banners/banners_cubit.dart';
import 'package:mr_candy/features/Home/presentation/controller/categories/categories_cubit.dart';
import 'package:mr_candy/features/Home/presentation/controller/productsdetails/products_details_cubit.dart';
import 'package:mr_candy/features/cart/presentation/controller/cart_cubit.dart';



import 'features/Home/data/models/category_model.dart';
import 'features/Home/presentation/controller/categoriesproducts/categories_products_cubit.dart';
import 'features/splash/presentation/views/splash_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("setting");



  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
          create:  (context) => BannerCubit(HomeRepoImplementation()),),

        BlocProvider(
         create:  (context) => CategoriesCubit(HomeRepoImplementation())),


          BlocProvider(create: (context) => CategoriesProductsCubit(HomeRepoImplementation())),


          BlocProvider(
              create:  (context) => ProductsDetailsCubit(HomeRepoImplementation())),
        ],

         
        child: const MyApp()),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(fontFamily: AppFonts.almarai),
      debugShowCheckedModeBanner: false,
      home:SplashScreen()
    );
  }
}

