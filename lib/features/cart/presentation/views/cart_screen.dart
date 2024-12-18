import 'package:flutter/material.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo_implementation.dart';
import 'package:mr_candy/features/cart/presentation/views/widgets/cart_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/cart_products_model.dart';
import '../controller/cart_cubit.dart';
import '../controller/cart_states.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => CartCubit(HomeRepoImplementation())..getCarts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('عربة التسوق'),
          centerTitle: true,

        ),
        body: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) {
            if (state is CartLoadingStates) {

              return Center(child: CircularProgressIndicator());


            } else if (state is CartFailureStates) {
              return Text(state.errorMessage);

            } else if (state is CartSuccessStates) {
              final cartItems = state.cartModel;

              return Column(

                children: [

                  Expanded(

                    child: ListView.separated(
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                    
                        final item = cartItems[index];
                        return CartItemCard(item: item);
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cartItems.length,
                    ),
                  ),
                 // Text();
                ],
              );
            }

            else {
              return Center(child: Text('لم يتم تحميل البيانات.'));
            }
          },
        ),

      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final CartModel item;

  const CartItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Product Image
        Image.network(
          item.categoryProductsModel.image,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 16),
        // Product Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.categoryProductsModel.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                '${item.categoryProductsModel.price} جنيه',
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      // Decrease quantity logic
                    },
                  ),
                  Text('${item.quantity}'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Increase quantity logic
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

