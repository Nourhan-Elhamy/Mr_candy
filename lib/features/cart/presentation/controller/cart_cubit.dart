import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo.dart';
import 'package:mr_candy/features/cart/presentation/controller/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(this.homeRepo) : super(CartInitialStates());

  final HomeRepo homeRepo;

  Future<void> getCarts() async {
    emit(CartLoadingStates());

    var result = await homeRepo.displayCarts();

    result.fold((left) {
      emit(CartFailureStates(errorMessage: left.errormessage));
    },
            (right) {
          emit(CartSuccessStates(cartModel: right));
        }

    );
  }


}


