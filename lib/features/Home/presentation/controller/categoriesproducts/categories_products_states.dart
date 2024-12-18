import 'package:mr_candy/features/Home/data/models/category_Products_model.dart';

import '../../../data/models/category_model.dart';

abstract class CategoriesProductsStates{}
class CategoriesProductsInitialState extends CategoriesProductsStates{}
class CategoriesProductsLoadingState extends CategoriesProductsStates{}
class CategoriesProductsSuccessState extends CategoriesProductsStates{
  final List<CategoryProductsModel> categoryproductsmodel;

  CategoriesProductsSuccessState({required this.categoryproductsmodel});
}
class CategoriesProductsFailureState extends CategoriesProductsStates{
  final String errormessage;
  CategoriesProductsFailureState({required this.errormessage});
}
