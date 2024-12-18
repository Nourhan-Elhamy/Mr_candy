import 'package:mr_candy/features/login/data/models/user_model.dart';

import '../data/models/register_model.dart';

abstract class RegisterStates{}
class RegisterInitialStates extends RegisterStates{}
class RegisterLoadingStates extends RegisterStates{}
class PickedImageState extends RegisterStates{}
class RegisterSuccessStates extends RegisterStates{
  final String message;
  final UserModel userModel;
  RegisterSuccessStates({required this.message,required this.userModel});

}
class RegisterFailureStates extends RegisterStates{
  final String errormessage;
  RegisterFailureStates({required this.errormessage});

}