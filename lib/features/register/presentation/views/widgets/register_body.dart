import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/features/register/presentation/views/widgets/register_form.dart';

import '../../../../../core/shared_widgets/logo_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../controller/register_cubit.dart';
import '../../data/repos/register_repo_implementation.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
        LogoWidget(),
        SizedBox(height: 20,),
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
              ),

                  child: RegisterForm()),
            )


      ],
    );
  }
}
