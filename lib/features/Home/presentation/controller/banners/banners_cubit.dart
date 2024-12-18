

import 'package:bloc/bloc.dart';
import 'package:mr_candy/core/errors/failure.dart';
import 'package:mr_candy/features/Home/data/repos/home_repo.dart';
import 'package:mr_candy/features/Home/presentation/controller/banners/banners_states.dart';

class BannerCubit extends Cubit<BannersStates>{
  BannerCubit(this.bannersRepo):super (BannersInitialStates());


  final HomeRepo bannersRepo;
  Future<void> getBanners() async{
    emit(BannersLoadingStates());

    var result=  await bannersRepo.banners();

    result.fold((left){

      emit(BannersFailureStates(error: left.errormessage));
    }, (right) {
      emit(BannersSuccessStates(bannersss: right ));
    });
}




}