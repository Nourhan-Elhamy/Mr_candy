import 'package:mr_candy/features/login/data/models/user_model.dart';

abstract class LoginStates{}
class LoginInitialStates extends LoginStates{}
class LoginLoadingStates extends LoginStates{}
class LoginSuccessStates extends LoginStates{
  final UserModel userModel;
  final String message;
  LoginSuccessStates({required this.userModel,required this.message});

}
class LoginFailureStates extends LoginStates{
  final String errormessage;
  LoginFailureStates({required this.errormessage});
}