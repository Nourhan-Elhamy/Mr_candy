import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy/features/Home/presentation/views/widgets/ListView_banners.dart';
import 'package:mr_candy/features/Home/presentation/views/widgets/category_widget.dart';
import '../../../../../core/shared_widgets/logo_widget.dart';
import '../../../../../core/utils/app_colors.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(

                        gradient: LinearGradient(
                          colors: [
                            AppColors.lavender2,
                            AppColors.lavender3
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight
                        )
                      ),
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      child: Center(
                        child: LogoWidget(),
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.only(top: 250),

                    ),
                    Positioned(
                      top: 180,
                      right: 20,
                      left: 20,

                      child:
                          Container(
                            height: 170,
                            child: ListViewBanners(),


                      ),

                    ),

                  ],
                ),

          ),
          Column(

            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

            Text(
              "الاقسام",
              style: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lavender),
            ),
            SizedBox(
              height: 300,
              child: CategoryWidget(),
            ),

              Text("الاكثر مبيعا",style: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lavender),),
          ],)
        ],

      ),

    );
  }
}
