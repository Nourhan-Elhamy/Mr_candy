import '../../../data/models/category_model.dart';

abstract class CategoriesStates{}
class CategoriesInitialState extends CategoriesStates{}
class CategoriesLoadingState extends CategoriesStates{}
class CategoriesSuccessState extends CategoriesStates{
final List<CategoryModel> categorymodel;

CategoriesSuccessState({required this.categorymodel});
}
class CategoriesFailureState extends CategoriesStates{
  final String errormessage;
  CategoriesFailureState({required this.errormessage});
}
