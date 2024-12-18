import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mr_candy/features/login/data/repos/login_repo.dart';
import 'package:mr_candy/features/login/presentation/controller/login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(this.loginRepo):super (LoginInitialStates());


  final LoginRepo loginRepo;
  Future<void> login({
    required String email,
    required String password

  }) async{
    emit(LoginLoadingStates());
    var result =await loginRepo.login(email: email, password: password);
    result.fold((left) {

      emit(LoginFailureStates(errormessage: left.errormessage));


    }, (right) async{

      final box= Hive.box("setting");
      await box.put("token", right.token);

      log("${right.token}");


      emit(LoginSuccessStates(userModel: right,message: right.message));
    }

    );

  }
}