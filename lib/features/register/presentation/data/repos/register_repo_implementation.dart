import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mr_candy/core/errors/failure.dart';
import 'package:mr_candy/core/utils/endpoints.dart';
import 'package:mr_candy/features/register/presentation/data/models/register_model.dart';
import 'package:mr_candy/features/register/presentation/data/repos/register_repo.dart';
import 'package:http/http.dart'as http;

import '../../../../login/data/models/user_model.dart';
class RegisterRepoImplementation implements RegisterRepo{
  @override
  Future<Either<Failure, UserModel>> register({
    required UserModelToRegister userModelToRegister
  })async {
   try{
   var result = await http.post( Uri.parse(EndPoints.baseUrl+EndPoints.register),
     body:
     {
       "name" :userModelToRegister.name,
       "email" :userModelToRegister.email,
       "phone" :userModelToRegister.phone,
       "password" :userModelToRegister.password,
       "image" :userModelToRegister.image,

     }

   );


   var body= jsonDecode(result.body);
   if (body["status"]){
     return right(UserModel(id: body["data"]["id"], name: body["data"]["name"], email: body["data"]["email"], phone: body["data"]["phone"], image: body["data"]["image"], token: body["data"]["token"], message: body["message"], points: 0, credit: 0));
   }else{

     return left(ApiFailure(errormessage: body["message"]));
   }
   }on SocketException{
     return left(NoInternetFailure(errormessage: "no internet"));
   }
   catch(e){
     return left(ApiFailure(errormessage: "error"));
   }


  }

}