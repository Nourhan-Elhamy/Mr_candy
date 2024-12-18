import '../../data/models/cart_products_model.dart';

abstract class CartStates{}
class CartInitialStates extends CartStates{}
class CartLoadingStates extends CartStates{}
class CartFailureStates extends CartStates{
  final String errorMessage;
  CartFailureStates({required this.errorMessage});
}
class CartSuccessStates extends CartStates{
  final List<CartModel> cartModel;

  CartSuccessStates({required this.cartModel,});
}




