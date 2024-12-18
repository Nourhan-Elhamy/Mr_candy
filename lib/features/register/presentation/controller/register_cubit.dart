
import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_candy/features/register/presentation/controller/register_states.dart';
import 'package:mr_candy/features/register/presentation/data/models/register_model.dart';
import 'package:mr_candy/features/register/presentation/data/repos/register_repo.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit(this.registerRepo):super (RegisterInitialStates());

  final RegisterRepo registerRepo;
  Future<void> register
      ({
         required UserModelToRegister userModelToRegister
      })


  async {

    emit(RegisterLoadingStates());
    var result= await registerRepo.register(userModelToRegister:userModelToRegister );

    result.fold((left){

      emit(RegisterFailureStates(errormessage: left.errormessage));
    },

            (right) async{


      emit(RegisterSuccessStates(message: right.message, userModel: right));


            });

  }




  XFile? image;
  String? base64;
  final ImagePicker picker = ImagePicker();
  Future<void> pickProfileImage(ImageSource imageSource ) async{
    image  = await picker.pickImage(source: imageSource);
    if(image!=null ){
      File imageFile =  File(image!.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      base64 = base64Encode(imageBytes);
      log("base64 ${base64}");


    }
    emit(PickedImageState());
  }

}