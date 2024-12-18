import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/core/utils/app_colors.dart';
import 'package:mr_candy/features/register/presentation/controller/register_cubit.dart';
import 'package:mr_candy/features/register/presentation/data/repos/register_repo_implementation.dart';
import 'package:mr_candy/features/register/presentation/views/widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lavender3,
      body: BlocProvider(
          create: (context) => RegisterCubit(RegisterRepoImplementation()),
          child: RegisterBody()),
    );
  }
}
