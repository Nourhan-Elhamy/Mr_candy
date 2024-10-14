import 'package:flutter/cupertino.dart';
import 'package:mr_candy/core/shared_widgets/logo_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              child: LoginForm(),
            )
        )

      ],
    );
  }
}
