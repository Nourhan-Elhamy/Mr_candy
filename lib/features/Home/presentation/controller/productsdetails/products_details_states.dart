import 'package:mr_candy/features/Home/data/models/category_Products_model.dart';

import '../../../data/models/category_model.dart';

abstract class ProductsDetailsStates{}
class ProductsDetailsInitialState extends ProductsDetailsStates{}
class ProductsDetailsLoadingState extends ProductsDetailsStates{}
class ProductsDetailsSuccessState extends ProductsDetailsStates{

  final CategoryProductsModel categoryproductsmodel;

  ProductsDetailsSuccessState({required this.categoryproductsmodel});
}
class ProductsDetailsFailureState extends ProductsDetailsStates{
  final String errormessage;
  ProductsDetailsFailureState({required this.errormessage});
}
