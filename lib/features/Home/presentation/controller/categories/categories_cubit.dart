

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mr_candy/core/errors/failure.dart';
import 'package:mr_candy/features/Home/data/models/category_model.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo.dart';
import 'package:mr_candy/features/Home/presentation/controller/banners/banners_states.dart';
import 'package:mr_candy/features/Home/presentation/controller/categories/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit(this.homeRepo) :super (CategoriesInitialState());

List<CategoryModel> cacheCategories = [];
  final HomeRepo homeRepo;

  Future<void> getCategory() async {
    emit(CategoriesLoadingState());

    if(cacheCategories.isNotEmpty){
      emit(CategoriesSuccessState(categorymodel: cacheCategories));
      return;
    }

    var result = await homeRepo.Categorys();

    result.fold((left) {
      emit(CategoriesFailureState(errormessage: left.errormessage));
    },
            (right)async {
      cacheCategories =right;

          emit(CategoriesSuccessState(categorymodel: right));
        });
  }


}



