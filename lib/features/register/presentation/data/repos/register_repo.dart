
 import 'package:dartz/dartz.dart';
import 'package:mr_candy/core/errors/failure.dart';
import 'package:mr_candy/features/login/data/models/user_model.dart';
import 'package:mr_candy/features/register/presentation/data/models/register_model.dart';

abstract class RegisterRepo{



  Future<Either<Failure,UserModel>> register ({
    required UserModelToRegister userModelToRegister
  });
 }