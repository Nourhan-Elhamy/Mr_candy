import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/features/login/data/repos/login_repo_implementation.dart';
import 'package:mr_candy/features/login/presentation/controller/login_cubit.dart';
import 'package:mr_candy/features/login/presentation/views/widgets/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender3,
      body: BlocProvider(
        create:(context) => LoginCubit(LoginRepoImplementation()),
          child: LoginBody()),
    );
  }
}
