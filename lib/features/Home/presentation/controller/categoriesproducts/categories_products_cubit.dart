import 'package:bloc/bloc.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo.dart';
import 'categories_products_states.dart';

class CategoriesProductsCubit extends Cubit<CategoriesProductsStates>{
  CategoriesProductsCubit(this.homeRepo):super (CategoriesProductsInitialState()) ;
  
  final HomeRepo homeRepo;
  
  
  Future<void> getCategoriesDetails({
    required int id
}) async{
    
    emit(CategoriesProductsLoadingState());
    
    var result =await homeRepo.categoryProducts(id:id);

    result.fold(
            (left) {
              emit(CategoriesProductsFailureState(errormessage: left.errormessage));
            },
            (right) {

              emit(CategoriesProductsSuccessState(categoryproductsmodel: right));

              print("${right}");

            });
  }
}