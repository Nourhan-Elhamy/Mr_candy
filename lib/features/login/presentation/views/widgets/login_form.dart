import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy/core/shared_widgets/text_button.dart';
import 'package:mr_candy/core/shared_widgets/textfield.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/features/Home/presentation/views/home_screen.dart';
import 'package:mr_candy/features/login/presentation/controller/login_cubit.dart';
import 'package:mr_candy/features/login/presentation/controller/login_states.dart';
import 'package:mr_candy/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/features/register/presentation/views/register_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key,});


  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(children: [
        SizedBox(height: 70,),
        CustomTextField(hinttext: "ادخل البريد الالكتروني",icon: Icons.email_outlined,controller: emailcontroller,),
        SizedBox(height: 29,),
        CustomTextField(hinttext: "ادخل كلمة المرور",icon: Icons.lock_open_sharp,controller: passcontroller,),
        SizedBox(height: 58,),

        BlocConsumer<LoginCubit,LoginStates>(
          listener: (context,state){
            if(state is LoginFailureStates){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errormessage,)));
            }
            else if(state is LoginSuccessStates){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message,)));
              Navigator.push(context, MaterialPageRoute(builder: (C){
                return HomeScreen();
              }));
            }
          },
          builder: (context, state) {
            return
            state is LoginLoadingStates?
              Center(
                  child: CircularProgressIndicator()):

              CustomTextButton(text: "تسجيل الدخول",
              onpressed: (){
              BlocProvider.of<LoginCubit>(context).login(email: emailcontroller.text.trim(), password: passcontroller.text.trim());


            },);
          }
        ),
        SizedBox(height: 29,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c){
                  return RegisterScreen();
                }));
              },
                child: Text("قم بانشاء حساب",style: TextStyle(color: AppColors.lavender))),
            Text("ليس لديك حساب؟",),
          ],
        )
      ],),
    );
  }
}
