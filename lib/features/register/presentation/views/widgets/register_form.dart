
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_candy/core/shared_widgets/text_button.dart';
import 'package:mr_candy/core/shared_widgets/textfield.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/features/Home/presentation/views/home_screen.dart';
import 'package:mr_candy/features/register/presentation/controller/register_cubit.dart';
import 'package:mr_candy/features/register/presentation/controller/register_states.dart';
import 'package:mr_candy/features/register/presentation/data/models/register_model.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}
class _RegisterFormState extends State<RegisterForm> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  XFile? image;
  String? base64;
  final ImagePicker picker = ImagePicker();
  Future<void> pickProfileImage(ImageSource imageSource ) async{
    image  = await picker.pickImage(source: imageSource);
    if(image!=null ){
      File imageFile =  File(image!.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      base64 = base64Encode(imageBytes);
Navigator.pop(context);
setState(() {

});
    }

  }

  @override
  Widget build(BuildContext context) {
    var registerCubit = BlocProvider.of<RegisterCubit>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              showBottomSheet(context: context, builder: (c) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                           pickProfileImage(ImageSource.gallery);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.photo_size_select_actual, color: AppColors.lavender),
                              Text("Gallery"),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            pickProfileImage(ImageSource.camera);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.camera_alt, color: AppColors.lavender),
                              Text("Camera"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
            },
            child: CircleAvatar(
              radius: 45,
              backgroundColor: AppColors.lavender,
              child: CircleAvatar(
                radius: 44,
                child: image == null
                    ? Icon(Icons.add_a_photo, color: AppColors.lavender)
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.file(
                    File(image!.path),
                    fit: BoxFit.cover,
                    width: 160,
                    height: 160,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(child: Text("اضف صوره شخصية")),
          SizedBox(height: 20),
          CustomTextField(hinttext: "ادخل الاسم", icon: Icons.person, controller: namecontroller),
          SizedBox(height: 20),
          CustomTextField(hinttext: "ادخل البريد الالكتروني", icon: Icons.email_outlined, controller: emailcontroller),
          SizedBox(height: 20),
          CustomTextField(hinttext: "ادخل رقم الهاتف", icon: Icons.phone_in_talk, controller: phonecontroller),
          SizedBox(height: 20),
          CustomTextField(hinttext: "ادخل كلمه المرور", icon: Icons.lock_open_sharp, controller: passwordcontroller),
          SizedBox(height: 20),


          BlocConsumer<RegisterCubit, RegisterStates>(

            listener: (context, state) {
              if (state is RegisterFailureStates) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errormessage, style: TextStyle(color: AppColors.white)),
                  backgroundColor: AppColors.lavender,
                ));
              } else if (state is RegisterSuccessStates) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message, style: TextStyle(color: AppColors.white)),
                  backgroundColor: AppColors.lavender,
                ));
              }
            },
            builder: (context, state) {
              return state is RegisterLoadingStates
                  ? Center(child: CircularProgressIndicator())
                  : CustomTextButton(
                    text: "انشاء الحساب",
                onpressed: () {

                  final bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(emailcontroller.text.trim());

                  if(!emailValid){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("البريد الإلكتروني غير صالح. الرجاء إدخال بريد إلكتروني صحيح.", style: TextStyle(color: AppColors.white)),
                      backgroundColor: AppColors.lavender,
                    ));
                  }else if(base64==null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("برجاء ادخال الصورة", style: TextStyle(color: AppColors.white)),
                      backgroundColor: AppColors.lavender,
                    ));
                  }else{

                  BlocProvider.of<RegisterCubit>(context).register(
                    userModelToRegister: UserModelToRegister(
                      name: namecontroller.text.trim(),
                      email: emailcontroller.text.trim(),
                      phone: phonecontroller.text.trim(),
                      image: base64!,
                      password: passwordcontroller.text.trim(),
                    ),
                  );

                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
