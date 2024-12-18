import 'package:bloc/bloc.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo.dart';
import 'products_details_states.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsStates>{
  ProductsDetailsCubit(this.homeRepo):super (ProductsDetailsInitialState()) ;
  
  final HomeRepo homeRepo;
  
  
  Future<void> getProductsDetails({
    required int productid
}) async{
    
    emit(ProductsDetailsLoadingState());
    
    var result =await homeRepo.productsDetails(productid:productid);
    print(result);

    result.fold(
            (left) {
              emit(ProductsDetailsFailureState(errormessage: left.errormessage));
            },
            (right) {

              emit(ProductsDetailsSuccessState(categoryproductsmodel: right));

              print("${right}");

            });
  }
}