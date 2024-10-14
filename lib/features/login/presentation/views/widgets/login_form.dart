import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_candy/core/shared_widgets/text_button.dart';
import 'package:mr_candy/core/shared_widgets/textfield.dart';
import 'package:mr_candy/features/onboarding/presentation/views/onboarding_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        SizedBox(height: 70,),
        CustomTextField(hinttext: "ادخل البريد الالكتروني",icon: Icons.email_outlined,),
        SizedBox(height: 29,),
        CustomTextField(hinttext: "ادخل كلمة المرور",icon: Icons.lock_open_sharp,),
        SizedBox(height: 58,),
        CustomTextButton(text: "تسجيل الدخول",onpressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (c){
            return OnboardingScreen();
          }));
        },)
      ],),
    );
  }
}
