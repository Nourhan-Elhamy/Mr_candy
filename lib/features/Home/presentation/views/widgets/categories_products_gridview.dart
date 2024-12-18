import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy/features/Home/presentation/views/widgets/product_details.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/category_Products_model.dart';

class CategoryProductsGridView extends StatelessWidget {
  const CategoryProductsGridView({super.key, required this.categoryproductmodel});

  final List<CategoryProductsModel> categoryproductmodel;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {

          final categoryproducts = categoryproductmodel[index];

          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(productid: categoryproducts.id!,),
                ),
              );
            },
            child: Container(

              decoration: BoxDecoration(
                color: AppColors.grey,
              ),

              child: Stack(

                children: [


                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Center(
                        child: Image.network(
                          categoryproducts.image!,
                          width: 100,
                           height: 100,
                          fit: BoxFit.contain,
                          ),
                      ),

                      SizedBox(height: 8),

                      Text(
                        categoryproducts.name!,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Text(
                            categoryproducts.price.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    left: 10,
                    child: Column(
                      children: [
                        Container(

                          padding: EdgeInsets.all(5),

                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),

                            color: AppColors.lavender3,

                          ),
                          child: Text(" % ${categoryproductmodel[index].discount.toString()} -",
                            style: TextStyle(color: AppColors.white,fontSize: 15),

                          ),
                        ),
                        SizedBox(height: 120,),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColors.lavender3,
                            borderRadius: BorderRadius.circular(10)
                          ),


                          child: Center(
                            child: IconButton(

                              onPressed: (){},

                              icon:Icon(Icons.add,size: 15,),
                              color: AppColors.white,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {  },
                      icon: Icon(Icons.favorite_border),

                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: categoryproductmodel.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 2,

        crossAxisSpacing: 20,

        mainAxisSpacing: 24,
      ),
    );
  }
}
