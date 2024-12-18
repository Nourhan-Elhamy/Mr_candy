import 'package:dartz/dartz.dart';
import 'package:mr_candy/features/login/data/models/user_model.dart';

import '../../../../core/errors/failure.dart';

abstract class LoginRepo{

  Future<Either<Failure,UserModel>>login({required  String email, required String password});

}