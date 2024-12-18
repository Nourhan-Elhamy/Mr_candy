import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo_implementation.dart';
import 'package:mr_candy/features/Home/presentation/controller/banners/banners_cubit.dart';
import 'package:mr_candy/features/Home/presentation/controller/banners/banners_states.dart';
import 'package:mr_candy/features/Home/presentation/controller/categories/categories_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListViewBanners extends StatefulWidget {
  const ListViewBanners({super.key});

  @override
  State<ListViewBanners> createState() => _ListViewBannersState();
}

class _ListViewBannersState extends State<ListViewBanners> {
  void initState(){
    super.initState();
    BlocProvider.of<BannerCubit>(context).getBanners();

  }
  @override
  PageController pageController=PageController();
  Widget build(BuildContext context) {
    return  BlocConsumer<BannerCubit, BannersStates>(

        listener: (context, state) {

          if (state is BannersFailureStates) {

            ScaffoldMessenger.of(context).showSnackBar(

              SnackBar(content: Text(state.error)),

            );
          }
        },
        builder: (context, state) {
          if (state is BannersLoadingStates) {

            return Center(child: CircularProgressIndicator());
          } else if (state is BannersSuccessStates) {

            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                  controller: pageController,
                    scrollDirection: Axis.horizontal,
                  
                    itemCount: state.bannersss.length,
                  
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                  
                                margin: EdgeInsets.only(right: 20),
                  
                                color: AppColors.white,
                  
                                child: Image.network(
                  
                                  state.bannersss[index].image,
                  
                                  fit: BoxFit.cover,
                                ),
                  
                      );
                    },
                  ),
                ),
                SizedBox(height: 20,),
                SmoothPageIndicator(
                    controller: pageController,
                    count: state.bannersss.length,
                  effect: WormEffect(
                    activeDotColor: AppColors.lavender,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 8,
                  ),
                )
              ],
            );
          }


          return SizedBox();
        },

    );
  }
}
