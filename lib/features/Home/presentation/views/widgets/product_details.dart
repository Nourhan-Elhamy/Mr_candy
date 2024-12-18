

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/core/shared_widgets/text_button.dart';
import 'package:mr_candy/features/Home/presentation/controller/productsdetails/products_details_cubit.dart';
import 'package:mr_candy/features/Home/presentation/controller/productsdetails/products_details_states.dart';
import 'package:mr_candy/features/cart/presentation/controller/cart_states.dart';
import '../../../../cart/presentation/controller/cart_cubit.dart';
import '../../../data/models/category_Products_model.dart';
class ProductDetailsScreen extends StatefulWidget {


  const ProductDetailsScreen({Key? key, required this.productid}) : super(key: key);
  final int productid;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsDetailsCubit>(context).getProductsDetails(productid: widget.productid );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProductsDetailsCubit,ProductsDetailsStates>(

          builder: (context, state) {
            if(state is ProductsDetailsLoadingState){
              return Center( child: CircularProgressIndicator(),);
            }
            else if(state is ProductsDetailsFailureState){

              return Text(state.errormessage);

            }else if (state is ProductsDetailsSuccessState){

              final product = state.categoryproductsmodel;

             return ListView(
               children: [
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                         product.image??"",
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 10,),

                      Text(product.name??"",style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 10,),

                      Text(
                        'Old Price: ${product.old_price??""} LE',
                        style: const TextStyle(fontSize: 20, color: Colors.green),
                      ),

                      Text('Discount: ${product.discount??""} %',

                        style: const TextStyle(fontSize: 18, color: Colors.red),),

                      Text(
                        'Price Now: ${product.price??""} LE',
                        style: const TextStyle(fontSize: 20, color: Colors.green),
                      ),

                      SizedBox(height:  10,),

                      Text(
                        product.desc??"",
                        style: const TextStyle(fontSize: 16),
                      ),


                      SizedBox(height:  100),
                      Text("data"),
                      CustomTextButton(text: "Add To Cart ",width: double.infinity,onpressed: (){},)


                    ],
                  ),
               ],
             );
            }
            return  SizedBox.shrink();
          }
        ),
      ),
    );
  }
}
